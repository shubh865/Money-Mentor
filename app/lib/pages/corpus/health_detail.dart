import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
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

  Future<void> pickDate(BuildContext context, int index) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        healthDetails[index]['experiencingFrom'] =
            DateFormat('dd/MM/yyyy').format(picked);
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
          style: title(color: Palette.white),
        ),
        backgroundColor: Palette.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter any current / past health issues',
              style: title1(color: Palette.black),
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
                        //   color: Palette.lightGrey,
                        border: Border.all(color: Palette.grey),
                        borderRadius: BorderRadius.circular(10),
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
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.local_hospital, color: Palette.black),
                              SizedBox(width: 8),
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
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Palette.black),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Experiencing from',
                                    labelStyle:
                                        smallDescp(color: Palette.black),
                                    border: OutlineInputBorder(),
                                  ),
                                  onTap: () => pickDate(context, index),
                                  controller: TextEditingController(
                                    text: healthDetails[index]
                                        ['experiencingFrom'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.upload_file, color: Palette.black),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextButton(
                                  onPressed: () => pickFile(index),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Upload File',
                                        style: smallDescp(color: Palette.black),
                                      ),
                                    ],
                                  ),
                                  style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              if (healthDetails[index]['report'] != null &&
                                  healthDetails[index]['report']!.isNotEmpty)
                                Expanded(
                                  child: Text(
                                    healthDetails[index]['report']!,
                                    style: smallDescp(color: Palette.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.info, color: Palette.black),
                              SizedBox(width: 8),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward, color: Palette.white),
                  label: Text(
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
          ],
        ),
      ),
    );
  }
}
