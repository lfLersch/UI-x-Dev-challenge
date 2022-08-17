import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Models/Combo.dart';

class ComboInfoSlider extends StatelessWidget {
  const ComboInfoSlider({
    Key? key,
    required CarouselController carouselController,
    required this.combos, required this.stripeHeight, required this.iconHeight, required this.fontSize,
  }) : _carouselController = carouselController, super(key: key);

  final CarouselController _carouselController;
  final List<Combo> combos;
  final double stripeHeight;
  final double iconHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(viewportFraction: 1),
      items: combos
          .map((item) => Column(
        children: [
          Container(
            height: stripeHeight,
            color: Colors.grey.shade200,
            child: Center(
              child: Row(
                children: [
                  Expanded(flex: 3, child: (Text(item.principal.name, style: TextStyle(fontSize: fontSize),))),
                  Expanded(flex: 2, child: (Text(item.principal.size, textAlign: TextAlign.center,style: TextStyle(fontSize: fontSize)))),
                  Expanded(
                    flex: 2,
                    child: Image.asset(item.principal.image),
                  ),
                  Expanded(
                      flex: 1,
                      child: (IconButton(
                        icon: Icon(Icons.add, size: iconHeight),
                        onPressed: () {},
                      ))),
                ],
              ),
            ),
          ),
          Container(
            height: stripeHeight,
            child: Center(
              child: Row(
                children: [
                  Expanded(flex: 3, child: (Text(item.other.name, style: TextStyle(fontSize: fontSize)))),
                  Expanded(flex: 2, child: (Text(item.other.size, textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize)))),
                  Expanded(
                    flex: 2,
                    child: Image.asset(item.other.image),
                  ),
                  Expanded(
                      flex: 1,
                      child: (IconButton(
                        icon: Icon(Icons.add, size: iconHeight),
                        onPressed: () {},
                      ))),
                ],
              ),
            ),
          ),
          Container(
            height: stripeHeight,
            color: Colors.grey.shade200,
            child: Center(
              child: Row(
                children: [
                  Expanded(flex: 3, child: (Text(item.another.name, style: TextStyle(fontSize: fontSize)))),
                  Expanded(flex: 2, child: (Text(item.another.size, textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize)))),
                  Expanded(
                    flex: 2,
                    child: Image.asset(item.another.image),
                  ),
                  Expanded(
                      flex: 1,
                      child: (IconButton(
                        icon: Icon(Icons.add, size: iconHeight),
                        onPressed: () {},
                      ))),
                ],
              ),
            ),
          ),
        ],
      ),
      )
          .toList(),
    );
  }
}