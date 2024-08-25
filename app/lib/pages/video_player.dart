import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final List<Map<String, String>> videoUrls = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  void _addVideoUrl() async {
    final topic = _controller.text;
    if (topic.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      final response = await http.post(
        Uri.parse('http://192.168.29.72:5002/search'),
        body: {'topic': topic},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          videoUrls.clear();
          for (var video in responseData) {
            videoUrls.add({
              'title': video['title'],
              'link': video['link'],
            });
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        // Handle error
      }

      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter video topic',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addVideoUrl,
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: buildVideoList(videoUrls),
                ),
        ],
      ),
    );
  }
}

Widget buildVideoList(List<Map<String, String>> videoUrls) {
  return ListView.builder(
    itemCount: videoUrls.length,
    itemBuilder: (context, index) {
      return VideoPlayerWidget(
        videoUrl: videoUrls[index]['link']!,
        title: videoUrls[index]['title']!,
      );
    },
  );
}

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;
  final String title;

  VideoPlayerWidget({required this.videoUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(videoUrl));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 200,
            child: WebViewWidget(
              controller: webViewController,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
