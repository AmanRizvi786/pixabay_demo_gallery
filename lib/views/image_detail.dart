import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageDetail extends StatelessWidget {
  final ImageModel image;

  // Constructor to receive the image data
  const ImageDetail({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    // Get screen width to adjust layout
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth > 800 ? 600 : screenWidth * 0.9, // Responsive max width
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      image.url,
                      fit: BoxFit.cover,
                      height: screenWidth > 800 ? 400 : 250, // Responsive height
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Display likes and views information
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn(Icons.thumb_up, image.likes, 'Likes'),
                    _buildStatColumn(Icons.visibility, image.views, 'Views'),
                  ],
                ),
                const SizedBox(height: 20),
                // Add a 'Back' button
                SizedBox(
                  width: screenWidth > 800 ? 200 : double.infinity, // Responsive width for button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Go Back'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build each stat column (likes and views)
  Widget _buildStatColumn(IconData icon, int count, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.purple, size: 30),
        const SizedBox(height: 5),
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Factory method to handle argument passed from Navigator (if needed)
  static Widget fromRouteArguments(Object? arguments) {
    final image = arguments as ImageModel; // Cast the argument to ImageModel
    return ImageDetail(image: image);
  }
}



