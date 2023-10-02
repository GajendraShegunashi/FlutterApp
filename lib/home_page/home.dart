// Importing necessary packages
import 'package:b1_gajendra/home_page/image_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'image_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Gallery',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 4.0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 7.0,
        ),
        itemCount:
            ImageData.imageUrls.length, // Use the image URLs from ImageData
        itemBuilder: (context, index) {
          final imageUrl = ImageData.imageUrls[index]; // Get the image URL
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust border radius as needed
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImageDetailScreen(imageUrl: imageUrl),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10.0), // Apply border radius to the image
                child: CachedNetworkImage(
                  imageUrl: imageUrl, // Image URL
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                  fit: BoxFit.cover, // Image fit mode
                  memCacheHeight: 300, // Height for image caching
                  memCacheWidth: 300, // Width for image caching
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
