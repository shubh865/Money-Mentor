import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedChipIndex = 0;
  final List<String> bobmessages = [
    "Hi, we're here to help you.",
  ];
  final List<String> usermessages = [
    "Hey! Nice to meet you, my name is Tej",
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        usermessages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _onSelectedChip(int index, String chipText) {
    setState(() {
      selectedChipIndex = index;
      usermessages.add(chipText);
    });
  }

  Widget _buildBOBMessage(String message) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message),
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
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
            Text('BOB chat', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Text('get help 24x7', style: TextStyle(color: Colors.grey, fontSize: 18)),
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
              itemCount: bobmessages.length + usermessages.length,
              itemBuilder: (context, index) {
                if (index < bobmessages.length) {
                  return _buildBOBMessage(bobmessages[index]);
                } else {
                  int userIndex = index - bobmessages.length;
                  return _buildUserMessage(usermessages[userIndex]);
                }
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      ChoiceChip(
                        label: Text('Internet issue'),
                        selected: selectedChipIndex == 0,
                        onSelected: (bool selected) {
                          _onSelectedChip(0, 'Internet issue');
                        },
                      ),
                      ChoiceChip(
                        label: Text('Issue with calls'),
                        selected: selectedChipIndex == 1,
                        onSelected: (bool selected) {
                          _onSelectedChip(1, 'Issue with calls');
                        },
                      ),
                      ChoiceChip(
                        label: Text('5G queries'),
                        selected: selectedChipIndex == 2,
                        onSelected: (bool selected) {
                          _onSelectedChip(2, '5G queries');
                        },
                      ),
                      ChoiceChip(
                        label: Text('International roaming'),
                        selected: selectedChipIndex == 3,
                        onSelected: (bool selected) {
                          _onSelectedChip(3, 'International roaming');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _sendMessage,
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
