import 'package:flutter/material.dart';
import 'package:bob_hacks/models/chapter.dart';

class ChapterDetailScreen extends StatelessWidget {
  final Chapter chapter;

  ChapterDetailScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
    print("Loading image from path: ${chapter.imgpath}"); // Debugging statement
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              chapter.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(chapter.description),
            SizedBox(height: 16),
            Image.asset(chapter.imgpath), // Ensure imgpath is correct
          ],
        ),
      ),
    );
  }
}
