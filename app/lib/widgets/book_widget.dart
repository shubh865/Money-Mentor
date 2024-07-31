import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/pages/pdf_viewer_screen.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_widgets.dart';
import 'package:bob_hacks/utils/ui_utils/text/typography.dart';
import 'package:flutter/material.dart';
// import 'pdf_viewer_screen.dart'; // Import the PDF viewer screen

class BookWidget extends StatelessWidget {
  final String title;
  final String authorName;
  final String imagePath;
  final String pdfPath;
  final int rating; // Add rating parameter

  BookWidget({required this.title, required this.authorName, required this.imagePath, required this.pdfPath, required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewerScreen(pdfPath: pdfPath), // Navigate to PDF viewer screen
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(5)), // Set the border radius for the card
        ),
        elevation: 5, // Add elevation to the card for a shadow effect
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.getPercentSize(3)), // Add padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(3)), // Ensure the image corners are rounded
                child: Image.asset(imagePath, height: SizeConfig.getPercentSize(20), width: double.infinity, fit: BoxFit.cover),
              ),
              // SizedBox(height: SizeConfig.getPercentSize(2)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewerScreen(pdfPath: pdfPath), // Navigate to PDF viewer screen
                    ),
                  );
                },
                child: Text(
                  title,
                  style: Typo.bookTitle,
                  textAlign: TextAlign.start, // Align text to the start
                ),
              ),
              // SizedBox(height: SizeConfig.getPercentSize(1)),
              Txt(
                authorName, // Author name
                style: Typo.authorName,
                textAlign: TextAlign.start, // Align text to the start
              ),
              SizedBox(height: SizeConfig.getPercentSize(1)),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: SizeConfig.getPercentSize(2),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
