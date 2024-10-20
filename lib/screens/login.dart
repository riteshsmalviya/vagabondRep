import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the HomePage
import 'register.dart'; // Import the RegisterPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Simple mock authentication function
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Show an error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both username and password')),
      );
    } else {
      // Assuming login is successful, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BoxConstraints constraints = BoxConstraints(
        maxWidth:
            MediaQuery.of(context).size.width * 0.9, // 90% of screen width
        maxHeight: MediaQuery.of(context).size.height * 0.9);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: constraints,
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
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Welcome to Vagabond! Please sign in or create a new account.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                  ),
                                  child: const Text('Login'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    // Navigate to the Register Page
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text('Register'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _usernameController, // Controller for username
                            decoration: const InputDecoration(
                              labelText: 'Email/Username',
                              hintText: 'Enter your email or username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _passwordController, // Controller for password
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _login, // Call the login function
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text('Submit'),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: null,
                                child: Text('Forgot password?'),
                              ),
                              TextButton(
                                onPressed: null,
                                child: Text('Terms & Conditions'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
