import 'dart:math';
import 'package:bob_hacks/models/Modules.dart';
import 'package:bob_hacks/pages/chapter_detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:bob_hacks/models/chapter.dart';
// import 'package:bob_hacks/models/module.dart'; // Ensure this file is correctly pointing to your module model
// import 'chapter_detail_screen.dart'; // Ensure this path is correct
import 'package:bob_hacks/utils/ui_utils/text/text_widgets.dart';
import 'package:bob_hacks/utils/ui_utils/text/typography.dart';

class ModuleDetailScreen extends StatelessWidget {
  final Modules module;

  ModuleDetailScreen({required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Txt(
              module.title,
              style: Typo.titleLarge,
            ),
            SizedBox(height: 16),
            Text(module.description),
            SizedBox(height: 16),
            Txt('Chapters:', style: Typo.titleMedium),
            ..._buildChaptersList(context, module.chaptersList),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChaptersList(BuildContext context, List<Chapter> chapters) {
    return chapters.map((chapter) {
      return ListTile(
        title: GestureDetector(
          child: Text('${chapter.number}. ${chapter.title}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChapterDetailScreen(chapter: chapter),
              ),
            );
          },
        ),
        subtitle: Text(chapter.description),
      );
    }).toList();
  }
}
