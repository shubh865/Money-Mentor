import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final String pdfPath;
  final int rating; // Add rating parameter

  BookWidget({required this.title, required this.imagePath, required this.pdfPath, required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle PDF opening here
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: SizeConfig.getPercentSize(25), width: SizeConfig.getPercentSize(45), fit: BoxFit.cover),
          // SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: 4),
          // Text(
          //   "Author Name", // Placeholder for author name
          //   style: TextStyle(fontSize: 14, color: Colors.grey),
          // ),
          // SizedBox(height: 4),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.yellow,
                size: 16,
              );
            }),
          ),
        ],
      ),
    );
  }
}
