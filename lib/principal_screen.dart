import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'Helper/AnimationHelper.dart';
import 'Models/Combo.dart';
import 'Models/Item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Widgets/combo_info_slider.dart';
import 'Widgets/combo_name_slider.dart';
import 'Widgets/spinning_combo_images.dart';
import 'Widgets/spinning_pentagon.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen>
    with TickerProviderStateMixin {
  List<Combo> combos = [
    Combo(
        'Sand\ncouch',
        //Color(0xc98f69),
        Colors.yellow.shade700,
        Item('Soft couch', 'images/couch3.png', '100 x 100'),
        Item('Pouching pad', 'images/pad3.png', '80 x 20'),
        Item('Couch capsule', 'images/pad4.png', '40 x 10')),
    Combo(
        'Ciano\nspot',
        Colors.teal.shade700,
        Item('Ciano couch', 'images/couch5.png', '210 x 130'),
        Item('Squared pad', 'images/pad1.png', '50 x 50'),
        Item('Sleep cushion', 'images/pad2.png', '40 x 40')),

  ];
  final CarouselController _carouselController = CarouselController();
  final CarouselController _carouselController2 = CarouselController();
  late AnimationController _controller;
  Color _color = Colors.green;
  late Timer _timer;
  final random = Random();
  double height = (window.physicalSize.shortestSide / window.devicePixelRatio);
  double width = (window.physicalSize.longestSide / window.devicePixelRatio);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    for(Combo combo in combos){
      initCombo(combo);
    }
    _timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      int time = _timer.tick % 14;
      switch (time) {
        case 0:
          AnimationHelper.advanceCombo(_carouselController, _carouselController2, _controller, combos[0].animationController);
          _color = combos[(time % 7)].color;
          break;
        case 7:
          AnimationHelper.advanceCombo(_carouselController, _carouselController2, _controller, combos[1].animationController);
          _color = combos[(time % 6)].color;
          break;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(width);
    print(height);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          child: Stack(
            children: [
              buildGreyStripes(),
              buildInformationArea(),
              buildSpinningCombo(),
              buildCentralButtons(),
              buildTypeComboIconButtosRow(),
              buildShopIconButton()
            ],
          ),
        ),
      ),
    );
  }

  Stack buildSpinningCombo() {
    return Stack(
              clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Positioned(
                  top: -0.30555555555 * height,
                  left: -0.129107981221 * width,
                  child: SpinningPentagon(controller: _controller, color: _color, width: 0.51643192488 * width),
                ),
                Positioned(
                  top: 0.10185185185 * height,
                  left: 0.05809859154 * width,
                  child: ComboNameSlider(carouselController2: _carouselController2, combos: combos, textSize: 0.10185185185 * height),
                ),
                SpinningComboImages(combo: combos[0], principalHeight: 0.4074074074 * height, secundaryHeight: 0.21643518518 * height),
                SpinningComboImages(combo: combos[1], principalHeight: 0.4074074074 * height, secundaryHeight: 0.21643518518 * height),
              ],
            );
  }

  Align buildCentralButtons() {
    return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.05092592592 * height),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 0.02037037037 * height,
                  shadowColor: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 0.28403755868  * width,
                    height: 0.12731481481 * height,
                    child: Row(children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.piano, size: 0.06111111111 * height)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 0.06111111111 * height)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 0.06111111111 * height)),
                      Container(
                        width: 0.00258215962  * width,
                        height: 0.08912037037 * height,
                        color: Colors.grey.shade200,
                        margin: EdgeInsets.only(left: 0.00645539906 * width, right: 0.01936619718 * width),
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                                size: 0.06111111111 * height
                            )),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ]),
                  ),
                ),
              ),
            );
  }

  Container buildShopIconButton() {
    return Container(
              margin: EdgeInsets.only(right: 0.02582159624 * width, bottom: 0.02546296296 * height),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.shopping_cart, size: 0.06111111111 * height)),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            );
  }

  Container buildTypeComboIconButtosRow() {
    return Container(
              margin: EdgeInsets.only(left: 0.02582159624 * width, bottom: 0.02546296296 * height),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(children: [
                  Container(
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.home, size: 0.06111111111 * height)),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.sports, size: 0.06111111111 * height,)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.tv, size: 0.06111111111 * height)),
                ]),
              ),
            );
  }

  Align buildInformationArea() {
    return Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 0.8912037037 * height,
                width: 0.45187793427 * width,
                child: Column(children: [
                  SizedBox(
                    height: 0.12731481481 * height,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My\nstorehouse',
                      style: TextStyle(fontSize: 0.0636574074 * height),
                    ),
                  ),
                  SizedBox(
                    height: 0.02546296296 * height,
                  ),
                  buildTableTitleRow(),
                  SizedBox(
                    height: 0.02546296296 * height,
                  ),
                  ComboInfoSlider(carouselController: _carouselController, combos: combos, stripeHeight: 0.12731481481 * height, iconHeight: 0.03819444444 * height, fontSize: 0.03564814814 * height),
                ]),
              ),
            );
  }

  Row buildTableTitleRow() {
    return Row(
                  children: [
                    Expanded(flex: 3, child: Text('PRODUCT', style: TextStyle(fontSize: 0.02546296296 * height),)),
                    Expanded(flex: 2, child: Container()),
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      child: Align(
                        child: Text('NO', style: TextStyle(fontSize: 0.02546296296 * height)),
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                );
  }

  Padding buildGreyStripes() {
    return Padding(
              padding: EdgeInsets.only(top: 0.36157407407 * height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 0.12731481481 * height,
                    color: Colors.grey.shade200,
                  ),
                  Container(
                    height: 0.12731481481 * height,
                  ),
                  Container(
                    height: 0.12731481481 * height,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
            );
  }

  void initCombo(Combo combo) {
    combo.initComboAnimation(width, height, AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000)));
    combo.setAnimation(CurveTween(curve: Curves.slowMiddle).animate(combo.animationController)
      ..addListener(() {
        setState(() {});
      }));
  }
}




