import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterCycle extends StatefulWidget {
  final List<String> texts;
  final TextStyle textStyle;
  final Duration typingSpeed;
  final Duration backspacingSpeed;
  final Duration pause;

  const TypewriterCycle({
    super.key,
    required this.texts,
    required this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 120),
    this.backspacingSpeed = const Duration(milliseconds: 80),
    this.pause = const Duration(milliseconds: 1000),
  });

  @override
  State<TypewriterCycle> createState() => _TypewriterCycleState();
}

class _TypewriterCycleState extends State<TypewriterCycle> {
  late String _currentText = "";
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      setState(() {
        if (!_isDeleting) {
          if (_charIndex < widget.texts[_textIndex].length) {
            _charIndex++;
            _currentText = widget.texts[_textIndex].substring(0, _charIndex);
          } else {
            // pause before deleting
            _timer?.cancel();
            Future.delayed(widget.pause, () {
              _isDeleting = true;
              _startBackspacing();
            });
          }
        }
      });
    });
  }

  void _startBackspacing() {
    _timer = Timer.periodic(widget.backspacingSpeed, (timer) {
      setState(() {
        if (_isDeleting) {
          if (_charIndex > 0) {
            _charIndex--;
            _currentText = widget.texts[_textIndex].substring(0, _charIndex);
          } else {
            // move to next word
            _timer?.cancel();
            _isDeleting = false;
            _textIndex = (_textIndex + 1) % widget.texts.length;
            _startTyping();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentText,
      style: widget.textStyle,
    );
  }
}
