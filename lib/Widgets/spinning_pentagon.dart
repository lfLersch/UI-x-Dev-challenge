import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class SpinningPentagon extends StatelessWidget {
  const SpinningPentagon({
    Key? key,
    required AnimationController controller,
    required Color color, required this.width
  }) : _controller = controller, _color = color, super(key: key);

  final AnimationController _controller;
  final Color _color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 0.2).animate(
            new CurvedAnimation(
                parent: _controller, curve: Curves.easeOut)),
        child: ClipPolygon(
          sides: 5,
          borderRadius: 25.0,
          child: AnimatedContainer(
            decoration: BoxDecoration(
              color: _color,
            ),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}