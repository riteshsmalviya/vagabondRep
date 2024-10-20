import 'package:flutter/material.dart';
// ignore: unused_import
import 'search_screen.dart'; // Import the SearchPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.black87),
                      const SizedBox(width: 8),
                      Text(
                        'VagaBond',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Map Preview
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/0,0,1,0,0/600x400?access_token=YOUR_MAPBOX_TOKEN',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Visited Places Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Visited Places',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Places List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  PlaceCard(
                    name: 'Eiffel Tower',
                    location: 'Paris, France',
                    imageUrl: 'https://images.unsplash.com/photo-1543349689-9a4d426bee8e',
                  ),
                  PlaceCard(
                    name: 'Mount Fuji',
                    location: 'Honshu, Japan',
                    imageUrl: 'https://images.unsplash.com/photo-1570789210967-2cac24afeb00',
                  ),
                  PlaceCard(
                    name: 'Great Wall',
                    location: 'China',
                    imageUrl: 'https://images.unsplash.com/photo-1508804185872-d7badad00f7d',
                  ),
                ],
              ),
            ),

            // Bottom Navigation
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.home, 'Home', true, context),
                    _buildNavItem(Icons.search, 'Search', false, context), // Navigate to search page
                    _buildNavItem(Icons.bookmark_border, 'Bucket List', false, context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Search') {
          // Navigate to SearchPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage {
  const SearchPage();
}

class PlaceCard extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;

  const PlaceCard({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            // Place Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            // Place Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
