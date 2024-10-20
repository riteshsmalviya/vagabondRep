import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VagaBond',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const CafeDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CafeDetailScreen extends StatelessWidget {
  const CafeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.place),
                      const SizedBox(width: 8),
                      Text(
                        'VagaBond',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const Icon(Icons.share),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Contact
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The Cozy Corner Cafe',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '123 Elm Street, Springfield',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Contact: (555) 123-4567',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Rating
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 4 ? Icons.star : Icons.star_half,
                                color: Colors.amber,
                                size: 20,
                              );
                            }),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '4.3 (200 reviews)',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Photos Section
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Photos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          _buildPhotoCard('assets/cafe_interior.jpg'),
                          _buildPhotoCard('assets/coffee.jpg'),
                          _buildPhotoCard('assets/outdoor.jpg'),
                        ],
                      ),
                    ),

                    // Reviews Section
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildReviewCard(
                      'Emily R.',
                      'Great ambiance and coffee! A perfect spot for a relaxing afternoon.',
                    ),
                    _buildReviewCard(
                      'John D.',
                      'Loved the outdoor seating area. Friendly staff and quick service.',
                    ),

                    // Location Section
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/0,0,1,0,0/600x400?access_token=YOUR_MAPBOX_TOKEN',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom Action Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.favorite_border, 'Like'),
                  _buildActionButton(Icons.bookmark_border, 'Save'),
                  _buildActionButton(Icons.share_outlined, 'Share'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoCard(String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildReviewCard(String author, String content) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            '- $author',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}