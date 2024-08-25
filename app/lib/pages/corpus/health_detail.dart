import 'package:bob_hacks/pages/corpus/corpus_predicment.dart.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/predict_corpus_response.dart';
import '../../models/recurring_expense.dart';

class HealthDetailsScreen extends StatefulWidget {
  final User user;

  HealthDetailsScreen({required this.user});

  @override
  _HealthDetailsScreenState createState() => _HealthDetailsScreenState();
}

class _HealthDetailsScreenState extends State<HealthDetailsScreen> {
  List<Map<String, String>> healthDetails = [];

  @override
  void initState() {
    super.initState();
    _initializeHealthDetails();
  }

  void _initializeHealthDetails() {
    if (widget.user.currentHealthConditions != null) {
      healthDetails = widget.user.currentHealthConditions!.map((condition) {
        return {
          'disease': condition.diseaseName ?? '',
          'experiencingFrom': condition.experiencingFrom ?? '',
          'report': '',
          'additionalInfo': '',
        };
      }).toList();
    } else {
      healthDetails = [
        {
          'disease': '',
          'experiencingFrom': '',
          'report': '',
          'additionalInfo': '',
        }
      ];
    }
  }

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
        final now = DateTime.now();
        final duration = Duration(
          days: now.difference(picked).inDays,
        );
        final months = (duration.inDays / 30).floor();
        final days = duration.inDays % 30;
        healthDetails[index]['experiencingFrom'] =
            '$months months and $days days';
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

  void _handleNext() {
    List<CurrentHealthCondition> updatedHealthConditions =
        healthDetails.map((detail) {
      return CurrentHealthCondition(
        diseaseName: detail['disease'],
        experiencingFrom: detail['experiencingFrom'],
      );
    }).toList();

    widget.user.currentHealthConditions = updatedHealthConditions;
    widget.user.age = 30;
    widget.user.retirementAge = 60;

    // Make the API call here with the updated user model
    print(widget.user.toMap()); // Example: Print user data to console
    predictRetirementCorpus(widget.user);
  }

  Future<void> predictRetirementCorpus(User user) async {
    final url = Uri.parse('http://192.168.29.72:5001/predictRetirementCorpus');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(user.toMap()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        ResponseData responseData = ResponseData.fromMap(data);
        // Handle the response data as needed
        // print('Response: $responseData');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Drop(responseData: responseData),
          ),
        );
      } else {
        print(
            'Failed to make the API call. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error making the API call: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize size configuration
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Palette.black,
        ),
        title: Text(
          'Health Details',
          style: title(color: Palette.black),
        ),
        backgroundColor: Palette.white,
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
                  onPressed: _handleNext,
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
