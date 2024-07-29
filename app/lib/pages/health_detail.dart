import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_style.dart';

class HealthDetailsScreen extends StatefulWidget {
  @override
  _HealthDetailsScreenState createState() => _HealthDetailsScreenState();
}

class _HealthDetailsScreenState extends State<HealthDetailsScreen> {
  List<Map<String, String>> healthDetails = [
    {
      'disease': '',
      'experiencingFrom': '',
      'report': '',
      'additionalInfo': '',
    }
  ];

  Future<void> pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        healthDetails[index]['report'] = result.files.single.name;
      });
    }
  }

  void addHealthDetail() {
    setState(() {
      healthDetails.add({
        'disease': '',
        'experiencingFrom': '',
        'report': '',
        'additionalInfo': '',
      });
    });
  }

  void deleteHealthDetail(int index) {
    setState(() {
      healthDetails.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize size configuration
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Details',
          style: title1(color: Palette.white),
        ),
        backgroundColor: Palette.darkPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter any current / past health issues',
              style: smallDescp(color: Palette.black),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: healthDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Palette.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Health Issue ${index + 1}',
                                style: title1(color: Palette.black),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Palette.red),
                                onPressed: () => deleteHealthDetail(index),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Disease name / Symptoms',
                                    labelStyle:
                                        smallDescp(color: Palette.black),
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      healthDetails[index]['disease'] = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Experiencing from',
                                    labelStyle:
                                        smallDescp(color: Palette.black),
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      healthDetails[index]['experiencingFrom'] =
                                          value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => pickFile(index),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.upload_file,
                                          color: Palette.black),
                                      SizedBox(width: 8),
                                      Text(
                                        healthDetails[index]['report']
                                                    ?.isEmpty ??
                                                true
                                            ? 'Upload File'
                                            : healthDetails[index]['report']!,
                                        style: smallDescp(color: Palette.black),
                                      ),
                                    ],
                                  ),
                                  style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Additional information',
                                    labelStyle:
                                        smallDescp(color: Palette.black),
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      healthDetails[index]['additionalInfo'] =
                                          value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Attached: ${healthDetails[index]['report']?.isEmpty ?? true ? 'No files attached' : healthDetails[index]['report']}',
                            style: smallDescp(color: Palette.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton.icon(
              onPressed: addHealthDetail,
              icon: Icon(Icons.add, color: Palette.primaryBlue),
              label: Text(
                'Add more',
                style: smallDescp(color: Palette.primaryBlue),
              ),
              style: TextButton.styleFrom(
                side: BorderSide(color: Palette.primaryBlue),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Next',
                style: title1(color: Palette.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.primaryBlue,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
