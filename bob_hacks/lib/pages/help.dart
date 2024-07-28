// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bob_hacks/constants/image_constants.dart';
import 'package:bob_hacks/pages/chat_screen.dart';
// import 'package:bob/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('help', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.qr_code, color: Colors.black),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.black,
            child: Row(
              children: [
                Icon(Icons.help, color: Colors.white),
                SizedBox(width: 8),
                Text('get help 24x7', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.chat), // Replace with your image asset
                SizedBox(width:20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'have a query?',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('talk to our chatbot, and resolve quickly'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                  },
                  child: Text('CHAT NOW',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                )
              ],
            ),
          ),
          // Add more content here if needed
        ],
      ),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
