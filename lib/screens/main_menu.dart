import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen =
        screenWidth > 1024; // define large screen threshold

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(isLargeScreen ? 40.0 : 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Conditionally include the icon stack for small/medium screens only
                        if (!isLargeScreen)
                          Flexible(
                            flex: 3,
                            child: SizedBox(
                              width: screenWidth * 0.5,
                              height: screenWidth * 0.5,
                              child: const Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Icon(Icons.flight, size: 50),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Icon(Icons.wifi, size: 50),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Icon(Icons.location_on, size: 50),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Icon(Icons.cloud, size: 50),
                                  ),
                                  Center(
                                    child: Icon(Icons.notifications, size: 100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        Flexible(
                          child: Text(
                            'Vagabond',
                            style: GoogleFonts.spaceGrotesk(
                              textStyle: TextStyle(
                                  fontSize: isLargeScreen ? 48 : 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Flexible(
                          child: Text(
                            'Connect through travel',
                            style: TextStyle(
                              fontSize: isLargeScreen
                                  ? screenWidth * 0.03
                                  : screenWidth * 0.05,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.all(screenWidth * 0.05),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                                child: Text(
                                  '₹',
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.06),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.all(screenWidth * 0.05),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                                child: const Icon(Icons.flight),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(screenWidth * 0.5, 50),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Get started',
                              style: TextStyle(fontSize: screenWidth * 0.06),
                            ),
                          ),
                        ),
                      ],
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
