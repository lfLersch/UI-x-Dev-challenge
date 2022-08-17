import 'dart:ui';

import 'package:flutter/material.dart';

import '../Models/Combo.dart';

class SpinningComboImages extends StatefulWidget {
  final Combo combo;
  final double principalHeight;
  final double secundaryHeight;
  const SpinningComboImages({required this.combo, required this.principalHeight, required this.secundaryHeight});

  @override
  State<SpinningComboImages> createState() => _SpinningComboImagesState();
}

class _SpinningComboImagesState extends State<SpinningComboImages> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: calculate(widget.combo.animation.value, widget.combo.principal.path).dy,
          left: calculate(widget.combo.animation.value, widget.combo.principal.path).dx,
          height: 160,
          child: Container(
            child: Image.asset(widget.combo.principal.image),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(350),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.4),
                  offset: Offset(-20, 20),
                  spreadRadius: 0,
                  blurRadius: 465, // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: calculate(widget.combo.animation.value, widget.combo.other.path).dy,
            left: calculate(widget.combo.animation.value, widget.combo.other.path).dx,
            height: 85,
            child: ClipRRect(
                child: ImageFiltered(
                    imageFilter:
                    ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Image.asset(widget.combo.other.image)))),
        Positioned(
            top: calculate(widget.combo.animation.value, widget.combo.another.path).dy,
            left: calculate(widget.combo.animation.value, widget.combo.another.path).dx,
            height: 85,
            child: ClipRRect(
                child: ImageFiltered(
                    imageFilter:
                    ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Image.asset(widget.combo.another.image)))),
      ],
    );
  }

  Offset calculate(value, path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
}