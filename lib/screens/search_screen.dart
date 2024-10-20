import 'package:flutter/material.dart';
// ignore: unused_import
import 'place_profile.dart'; // Import the PlaceProfile page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for places',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Recommended Places Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommended Places',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Filters',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recommended Places List
              Expanded(
                child: ListView(
                  children: [
                    PlaceCard(
                      name: 'Central Park',
                      rating: 4.5,
                      distance: 2.5,
                      description:
                          'A sprawling park in the city center known for its lush greenery and walking paths.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaceProfile(placeName: 'Central Park'),
                          ),
                        );
                      },
                    ),
                    PlaceCard(
                      name: 'Museum of Art',
                      rating: 4.8,
                      distance: 1.2,
                      description:
                          'Home to a vast collection of artworks spanning different eras and styles.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaceProfile(placeName: 'Museum of Art'),
                          ),
                        );
                      },
                    ),
                    PlaceCard(
                      name: 'City Library',
                      rating: 4.2,
                      distance: 3.0,
                      description:
                          'A modern library offering a vast collection of books and a peaceful reading environment.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaceProfile(placeName: 'City Library'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceProfile {
  PlaceProfile({String? placeName});
}

class PlaceCard extends StatelessWidget {
  final String name;
  final double rating;
  final double distance;
  final String description;
  final VoidCallback onTap;

  const PlaceCard({
    super.key,
    required this.name,
    required this.rating,
    required this.distance,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Rating: $rating',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$distance km away',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
