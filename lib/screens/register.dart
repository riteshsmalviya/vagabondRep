// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vagabond/firebase_options.dart';
import 'package:vagabond/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vagabond/screens/main_menu.dart'; // Add this import

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _name;
  late final TextEditingController _mobileno;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmpassword;

  late ScaffoldMessengerState _scaffoldMessenger;
  late NavigatorState _navigator;

  bool isLoading = false;

  @override
  void didChangeDependencies() {
    _scaffoldMessenger = ScaffoldMessenger.of(context);
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _name = TextEditingController();
    _mobileno = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _mobileno.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Firebase initialized successfully, show registration form
              return LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.language, size: 24),
                                    SizedBox(width: 8),
                                    Text(
                                      'Vagabond',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Create a new account to start your journey with Vagabond!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    labelText: 'Full Name',
                                    hintText: 'Enter your full name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _mobileno,
                                  maxLength: 10,
                                  decoration: const InputDecoration(
                                    labelText: 'Mobile Number',
                                    hintText: 'Enter your mobile number',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _email,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'Enter your email address',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _password,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _confirmpassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Confirm Password',
                                    hintText: 'Confirm your password',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: isLoading
                                      ? null
                                      : () async {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          final name = _name.text.trim();
                                          final email = _email.text.trim();
                                          final password =
                                              _password.text.trim();
                                          final cnfpassword =
                                              _confirmpassword.text.trim();

                                          // Mobile Number Validation Checks
                                          String mobileStr =
                                              _mobileno.text.trim();
                                          if (mobileStr.length != 10) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Invalid Mobile Number')),
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            return;
                                          }
                                          try {
                                            int.parse(mobileStr);
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Please Enter Valid Mobile Number')),
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            return;
                                          }

                                          // Validation Checks for the Registration form
                                          if (name.isEmpty ||
                                              email.isEmpty ||
                                              password.isEmpty ||
                                              cnfpassword.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Please Fill All Fields')),
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            return;
                                          }
                                          if (password != cnfpassword) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Passwords Do Not Match')),
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            return;
                                          }

                                          try {
                                            // Creating Users with email and password
                                            UserCredential userCredential =
                                                await FirebaseAuth.instance
                                                    .createUserWithEmailAndPassword(
                                                        email: email,
                                                        password: password);

                                            await FirebaseFirestore.instance
                                                .collection('UserDetails')
                                                .doc(userCredential.user?.uid)
                                                .set({
                                              'name': name,
                                              'mobile': mobileStr,
                                              'email': email,
                                            });

                                            _scaffoldMessenger.showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Registration Successful')));

                                            // Navigate to Login Screen after Successful Registration
                                            _navigator.pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage()),
                                            );
                                          } on FirebaseAuthException catch (e) {
                                            String errorMessage =
                                                'An error occurred';
                                            if (e.code ==
                                                'email-already-in-use') {
                                              errorMessage =
                                                  'User Already Exists';
                                            } else if (e.code ==
                                                'weak-password') {
                                              errorMessage = 'Weak password';
                                            } else if (e.code ==
                                                'invalid-email') {
                                              errorMessage =
                                                  'Invalid email address';
                                            }

                                            _scaffoldMessenger.showSnackBar(
                                              SnackBar(
                                                  content: Text(errorMessage)),
                                            );
                                          } finally {
                                            // Ensure the loading state is reset
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                  ),
                                  child: const Text('Register'),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account?'),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      },
                                      child: const Text('Login'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'By registering, you agree to our Terms & Conditions and Privacy Policy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainMenuPage()));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
