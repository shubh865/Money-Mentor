import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/pages/Animated_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  int selectedChipIndex = 0;
  final List<String> bobmessages = ["Hi, we're here to help you  Deep Parekh."];
  final List<String> usermessages = ["Hey! Nice to meet you"];
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  late AnimationController _controllerDots;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controllerDots = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controllerDots, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controllerDots.dispose();
    super.dispose();
  }

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      setState(() {
        usermessages.add(message);
        isLoading = true;
      });

      String bobResponse = await _getResponseFromApi(message);
      setState(() {
        bobmessages.add(bobResponse);
        isLoading = false;
      });
    }
  }

  Future<String> _getResponseFromApi(String message) async {
    try {
      final url = Uri.parse('http://192.168.29.72:5001/chat');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'category': (selectedChipIndex + 1).toString(),
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String responseData = data['data'] ?? 'Failed to get response from API';
        // Replace **text** with <b>text</b> and \n with <br>
        responseData = responseData
            .replaceAllMapped(
                RegExp(r'\*\*(.*?)\*\*'), (match) => '<b>${match.group(1)}</b>')
            .replaceAll('\n', '<br>');
        return responseData;
      } else {
        return 'Failed to get response from API';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  void _onSelectedChip(int index, String chipText) {
    setState(() {
      selectedChipIndex = index;
    });
    //_sendMessage(chipText);
  }

  Widget _buildBOBMessage(String message) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Palette.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.getPercentSize(3)),
              decoration: BoxDecoration(
                color: Palette.lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AnimatedText(
                text: message,
                duration: Duration(
                    seconds: message.length ~/ 10), // Adjust duration as needed
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.getPercentSize(3)),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDot(animation: _animation, index: 0),
          SizedBox(width: 4),
          AnimatedDot(animation: _animation, index: 1),
          SizedBox(width: 4),
          AnimatedDot(animation: _animation, index: 2),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BOB chat',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text('get help 24x7',
                style: TextStyle(color: Colors.grey, fontSize: 18)),
          ],
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: usermessages.length +
                  bobmessages.length +
                  (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < usermessages.length + bobmessages.length) {
                  int userIndex = index ~/ 2;
                  int bobIndex = index ~/ 2;

                  if (index % 2 == 0 && userIndex < usermessages.length) {
                    return _buildUserMessage(usermessages[userIndex]);
                  } else if (index % 2 != 0 && bobIndex < bobmessages.length) {
                    return _buildBOBMessage(bobmessages[bobIndex]);
                  }
                }

                if (isLoading &&
                    index == usermessages.length + bobmessages.length) {
                  return _buildLoadingIndicator();
                }

                return SizedBox.shrink();
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConfig.getPercentSize(3)),
                  child: Wrap(
                    spacing: SizeConfig.getPercentSize(3),
                    runSpacing: SizeConfig.getPercentSize(2),
                    children: [
                      ChoiceChip(
                        label: Text('Credit Monitoring'),
                        selected: selectedChipIndex == 0,
                        onSelected: (bool selected) {
                          _onSelectedChip(0, 'Credit Monitoring');
                        },
                      ),
                      ChoiceChip(
                        label: Text('Investment Strategy'),
                        selected: selectedChipIndex == 1,
                        onSelected: (bool selected) {
                          _onSelectedChip(1, 'Investment Strategy');
                        },
                      ),
                      ChoiceChip(
                        label: Text('Retirement Planning'),
                        selected: selectedChipIndex == 2,
                        onSelected: (bool selected) {
                          _onSelectedChip(2, 'Retirement Planning');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.getPercentSize(5)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSubmitted: (value) {
                            _sendMessage(value);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          _sendMessage(_controller.text);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedDot extends StatelessWidget {
  final Animation<double> animation;
  final int index;

  const AnimatedDot({Key? key, required this.animation, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: index == 0 ? animation.value : 1 - animation.value,
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
