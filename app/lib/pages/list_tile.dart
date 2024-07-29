import 'package:bob_hacks/pages/corpus_predicment.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_style.dart';
import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker', style: smallDescp()),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Total Corpus Required: 1000000',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView(
            children: [
              ListTileWithDropdown(
                title: 'Fruits',
                subItems: ['Apple', 'Banana', 'Orange'],
              ),
              ListTileWithDropdown(
                title: 'Vegetables',
                subItems: ['Carrot', 'Tomato', 'Potato'],
              ),
              ListTileWithDropdown(
                title: 'Animals',
                subItems: ['Dog', 'Cat', 'Horse'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
