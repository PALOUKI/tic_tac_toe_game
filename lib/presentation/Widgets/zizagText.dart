import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class ZigzagText extends StatefulWidget {
  final String text;
  const ZigzagText({required this.text});

  @override
  State<ZigzagText> createState() => _ZigzagTextState();
}

class _ZigzagTextState extends State<ZigzagText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.text.split('').asMap().entries.map((entry) {
        int index = entry.key;
        String char = entry.value;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double offset = sin(_controller.value * 2 * pi + index) * 10;
            return Transform.translate(
              offset: Offset(0, offset),
              child: Text(
                char,
                style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
