import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Models/Combo.dart';

class ComboNameSlider extends StatelessWidget {
  const ComboNameSlider({
    Key? key,
    required CarouselController carouselController2,
    required this.combos, required this.textSize,
  }) : _carouselController2 = carouselController2, super(key: key);

  final CarouselController _carouselController2;
  final List<Combo> combos;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: CarouselSlider(
          carouselController: _carouselController2,
          options: CarouselOptions(viewportFraction: 1),
          items: combos
              .map((item) => FittedBox(
            fit: BoxFit.fill,
            child: Text(item.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,)),
          )).toList()),
    );
  }
}