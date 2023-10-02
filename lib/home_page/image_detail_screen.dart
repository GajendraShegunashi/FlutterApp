// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDetailScreen extends StatelessWidget {
  final String imageUrl; // The URL of the image to display

  const ImageDetailScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'), // App Bar Title
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl, // Image URL to display
          placeholder: (context, url) => const CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ), // Placeholder widget while the image is loading
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ), // Widget to display if an error occurs while loading the image
          fit: BoxFit.cover, // Image fit mode
          memCacheHeight: 300, // Height for image caching
          memCacheWidth: 300, // Width for image caching
        ),
      ),
    );
  }
}
