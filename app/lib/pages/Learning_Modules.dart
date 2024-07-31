
import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/pages/video_player.dart';
import 'package:flutter/material.dart';
import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/models/Modules.dart';
import 'package:bob_hacks/pages/module_detailed_screen.dart';
import 'package:bob_hacks/widgets/book_widget.dart';

class Educatescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Learning Modules', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Learning"),
              Tab(text: "Videos"),
              Tab(text: "Books"),
            ],
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: TabBarView(
          children: [
            _buildLearningTab(context),
            VideoListScreen(),
            _buildBooksTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningTab(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: Modules.modules.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Palette.Module_cards,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. ${Modules.modules[index].title}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("${Modules.modules[index].chapters}",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  height: 4,
                  width: double.infinity,
                  color: _getLineColor(index),
                ),
                Text(
                  Modules.modules[index].description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModuleDetailScreen(module: Modules.modules[index]),
                          ),
                        );
                      },
                      child: Text(Modules.modules[index].module,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(Modules.modules[index].translate,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBooksTab(BuildContext context) {
    // List of books for demonstration
    final List<Map<String, dynamic>> books = [
      {'title': 'Corporate Finance by University of Mumbai','authorName':'Prof. Suhas Pednekar, Ravindra D. Kulkarni','imagePath': 'assets/jpgs/Ch1.jpg', 'pdfPath': 'assets/pdfs/pdf_1.pdf', 'rating': 4},
      {'title': 'International Finance University Of Mumbai','authorName':'University Of Mumbai', 'imagePath': 'assets/jpgs/Ch2.jpg', 'pdfPath': 'assets/pdfs/pdf_1.pdf', 'rating': 5},
      {'title': 'Notes on Corporate Finance','authorName':'Zhipeng Yan', 'imagePath': 'assets/jpgs/Ch3.jpg', 'pdfPath': 'assets/pdfs/pdf_1.pdf', 'rating': 4},
      {'title': 'Basics of Finance', 'authorName':'Gabor Kurthy, Jozsef Varga, Tamas Pesuth, Geza Sebestyen, Gabor Sztanoand Erzsebet Varga','imagePath': 'assets/jpgs/Ch4.jpg', 'pdfPath': 'assets/pdfs/pdf_1.pdf', 'rating': 3},
      {'title': 'Stock Market Development and Corporate Finance Decisions','authorName' :'Asli Demirgüç-Kunt','imagePath': 'assets/jpgs/Ch5.jpg', 'pdfPath': 'assets/pdfs/pdf_1.pdf', 'rating': 5},
      {'title': 'Introduction to Financial Accounting SE by David Annand','authorName':'David Annand,', 'imagePath': 'assets/jpgs/Ch1.jpg', 'pdfPath': 'assets/pdfs/pdf_1.pdf', 'rating': 4},
    ];

    return GridView.builder(
      padding: EdgeInsets.all(SizeConfig.getPercentSize(3)),
      itemCount: books.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: SizeConfig.getPercentSize(5),
        mainAxisSpacing: SizeConfig.getPercentSize(5),
      ),
      itemBuilder: (context, index) {
        return BookWidget(
          title: books[index]['title']!,
          authorName: books[index]['authorName']!,
          imagePath: books[index]['imagePath']!,
          pdfPath: books[index]['pdfPath']!,
          rating: books[index]['rating']!,
        );
      },
    );
  }
  Color _getLineColor(int index) {
    switch (index % 5) {
      case 0:
        return Colors.yellow;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
      case 4:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
