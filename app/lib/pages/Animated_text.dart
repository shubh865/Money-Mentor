import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final Duration duration;

  const AnimatedText({Key? key, required this.text, required this.duration})
      : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    // Adjust the duration here to make the animation faster
    _controller = AnimationController(
      duration: Duration(
          milliseconds: widget.text.length * 20), // Adjust multiplier as needed
      vsync: this,
    );
    _animation =
        IntTween(begin: 0, end: widget.text.length).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        String visibleText = widget.text.substring(0, _animation.value);
        return Html(
            data: visibleText.replaceAll('\n', '<br>').replaceAllMapped(
                RegExp(r'\*\*(.*?)\*\*'),
                (match) => '<b>${match.group(1)}</b>'));
      },
    );
  }
}
