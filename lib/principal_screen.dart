import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'Models/Combo.dart';
import 'Models/Item.dart';
import 'package:carousel_slider/carousel_slider.dart';


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
        Item('Soft couch', 'images/couch3.png', '110 x 110'),
        Item('Pouching pad', 'images/pad3.png', '50 x 50'),
        Item('Couch capsule', 'images/pad4.png', '40 x 20')),
    Combo(
        'Ciano\nspot',
        Colors.teal.shade700,
        Item('Ciano couch', 'images/couch5.png', '110 x 110'),
        Item('Squared pad', 'images/pad1.png', '50 x 50'),
        Item('Sleep cushion', 'images/pad2.png', '40 x 40')),

  ];
  final CarouselController _carouselController = CarouselController();
  final CarouselController _carouselController2 = CarouselController();
  late AnimationController _controller;
  Color _color = Colors.green;
  late Timer _timer;
  final random = Random();
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation _animationPad1;
  late Animation _animationPad2;
  late Animation _animationPad3;
  late Animation _animationPad4;
  late Animation _animationCouch1;
  late Animation _animationCouch2;
  late Path _path1;
  late Path _path2;
  late Path _path3;
  late Path _path4;
  late Path _path5;
  late Path _path6;
  double height = 392;
  double width = 774;
  int quadrant = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animationPad1 = CurveTween(curve: Curves.slowMiddle).animate(_controller2);
    _animationPad2 = CurveTween(curve: Curves.slowMiddle).animate(_controller2);
    _animationCouch1 =
        CurveTween(curve: Curves.slowMiddle).animate(_controller2)
          ..addListener(() {
            setState(() {});
          });

    _controller3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animationPad3 = CurveTween(curve: Curves.slowMiddle).animate(_controller3);
    _animationPad4 = CurveTween(curve: Curves.slowMiddle).animate(_controller3);
    _animationCouch2 =
        CurveTween(curve: Curves.slowMiddle).animate(_controller3)
          ..addListener(() {
            setState(() {});
          });
    _path1 = drawPath1();
    _path2 = drawPath2();
    _path3 = drawPath3();
    _path4 = drawPath1();
    _path5 = drawPath2();
    _path6 = drawPath3();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      int time = _timer.tick % 14;

      switch (time) {
        case 0:
          _carouselController.nextPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
          _carouselController2.nextPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
          _color = combos[(time % 7)].color;
          _controller.reset();
          _controller.forward();
          _controller2.reset();
          _controller2.forward();
          break;
        case 7:
          _carouselController.nextPage(duration: Duration(seconds: 1,), curve: Curves.decelerate);
          _carouselController2.nextPage(duration: Duration(seconds: 1,), curve: Curves.decelerate);
          _color = combos[(time % 6)].color;
          _controller.reset();
          _controller.forward();
          _controller3.reset();
          _controller3.forward();
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 142.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      color: Colors.grey.shade200,
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      color: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),


              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 350,
                  width: 350,
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My\nstorehouse',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(flex: 3, child: Text('PRODUCT', style: TextStyle(fontSize: 10),)),
                        Expanded(flex: 2, child: Container()),
                        Expanded(flex: 2, child: Container()),
                        Expanded(
                          child: Align(
                            child: Text('NO', style: TextStyle(fontSize: 10)),
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(viewportFraction: 1),
                      items: combos
                          .map((item) => Column(
                        children: [
                          Container(
                            height: 50,
                            color: Colors.grey.shade200,
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(flex: 3, child: (Text(item.principal.name))),
                                  Expanded(flex: 2, child: (Text(item.principal.size, textAlign: TextAlign.center,))),
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(item.principal.image),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: (IconButton(
                                        icon: Icon(Icons.add, size: 15),
                                        onPressed: () {},
                                      ))),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(flex: 3, child: (Text(item.other.name))),
                                  Expanded(flex: 2, child: (Text(item.other.size, textAlign: TextAlign.center,))),
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(item.other.image),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: (IconButton(
                                        icon: Icon(Icons.add, size: 15),
                                        onPressed: () {},
                                      ))),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            color: Colors.grey.shade200,
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(flex: 3, child: (Text(item.another.name))),
                                  Expanded(flex: 2, child: (Text(item.another.size, textAlign: TextAlign.center,))),
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(item.another.image),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: (IconButton(
                                        icon: Icon(Icons.add, size: 15),
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
                    ),



                  ]),
                ),
              ),
              Stack(
                clipBehavior: Clip.hardEdge,
                children: <Widget>[
                  Positioned(
                    top: -120,
                    left: -100,
                    child: Container(
                      width: 400,
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
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 45,
                    child: Container(
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
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,)),
                          )).toList()),
                    ),
                  ),
                  Positioned(
                    top: calculate(_animationCouch1.value, _path1).dy,
                    left: calculate(_animationCouch1.value, _path1).dx,
                    child: Container(
                      child: Image.asset("images/couch3.png"),
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
                    height: 160,
                  ),
                  Positioned(
                      top: calculate(_animationPad1.value, _path2).dy,
                      left: calculate(_animationPad1.value, _path2).dx,
                      child: ClipRRect(
                          child: ImageFiltered(
                              imageFilter:
                              ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Image.asset("images/pad3.png"))),
                      height: 80),
                  Positioned(
                      top: calculate(_animationPad2.value, _path3).dy,
                      left: calculate(_animationPad2.value, _path3).dx,
                      child: ClipRRect(
                          child: ImageFiltered(
                              imageFilter:
                              ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Image.asset("images/pad4.png"))),
                      height: 85),
                  Positioned(
                    top: calculate(_animationCouch2.value, _path1).dy,
                    left: calculate(_animationCouch2.value, _path1).dx,
                    child: Container(
                      child: Image.asset("images/couch5.png"),
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
                    height: 160,
                  ),
                  Positioned(
                      top: calculate(_animationPad3.value, _path5).dy,
                      left: calculate(_animationPad3.value, _path5).dx,
                      child: ClipRRect(
                          child: ImageFiltered(
                              imageFilter:
                              ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Image.asset("images/pad1.png"))),
                      height: 80),
                  Positioned(
                      top: calculate(_animationPad4.value, _path6).dy,
                      left: calculate(_animationPad4.value, _path6).dx,
                      child: ClipRRect(
                          child: ImageFiltered(
                              imageFilter:
                              ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Image.asset("images/pad2.png"))),
                      height: 85),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 220,
                      height: 50,
                      child: Row(children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.piano)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                        Container(
                          width: 2,
                          height: 35,
                          color: Colors.grey.shade200,
                          margin: EdgeInsets.only(left: 5, right: 15),
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              )),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(children: [
                    Container(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.sports)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.tv)),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Path drawPath1() {
    Path path = Path();
    path.moveTo(190, -220);
    path.quadraticBezierTo(230, 0, 150, 140);
    path.quadraticBezierTo(0, 210, -300, 110);
    return path;
  }

  Path drawPath2() {
    Path path = Path();
    path.moveTo(290, -270);
    path.quadraticBezierTo(380, -100, 260, 100);
    path.quadraticBezierTo(120, 250, -130, 190);
    return path;
  }

  Path drawPath3() {
    Path path = Path();
    path.moveTo(150, -220);
    path.quadraticBezierTo(230, 20, 70, 200);
    path.quadraticBezierTo(-50, 250, -350, 150);
    return path;
  }

  Offset calculate(value, path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
}
