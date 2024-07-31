import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/models/Modules.dart';
import 'package:bob_hacks/pages/module_detailed_screen.dart';
import 'package:flutter/material.dart';
// import 'module_detail_screen.dart';
// import 'module.dart'; // Ensure this path is correct

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
              Tab(text: "AI Learning"),
            ],
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: TabBarView(
          children: [
            _buildLearningTab(context),
            Center(child: Text("Videos")),
            Center(child: Text("AI Learning")),
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
