import 'dart:ui';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class AnimationHelper{
  static Path drawPath1(double width, double height) {
    Path path = Path();
    path.moveTo(0.245305164319 *  width, -0.56018518518 *  height);
    path.quadraticBezierTo(0.296948356808  *  width, 0 *  height, 0.193661971831  *  width, 0.35648148148  *  height);
    path.quadraticBezierTo(0 *  width, 0.53472222222  *  height, -0.387323943662 *  width, 0.28009259259  *  height);
    return path;
  }

  static Path drawPath2(double width, double height) {
    Path path = Path();
    path.moveTo(0.37441314554 *  width, -0.6875  *  height);
    path.quadraticBezierTo(0.490610328638  *  width, -0.25462962963 *  height, 0.335680751174  *  width, 0.25462962963  *  height);
    path.quadraticBezierTo(0.154929577465  *  width, 0.63657407407  *  height, -0.167840375587  *  width, 0.48379629629  *  height);
    return path;
  }

  static Path drawPath3(double width, double height) {
    Path path = Path();
    path.moveTo(0.193661971831   *  width, -0.56018518518 *  height);
    path.quadraticBezierTo(0.296948356808  *  width, 0.05092592592  *  height, 0.0903755868545  *  width, 0.50925925925  *  height);
    path.quadraticBezierTo(-0.645539906103 *  width, 0.63657407407  *  height, -0.451877934272  *  width, 0.38194444444  *  height);
    return path;
  }

  Offset calculate(value, path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }

  static void advanceCombo(CarouselController comboNameController, CarouselController itemsController, AnimationController pentagonController, AnimationController imageController){
    comboNameController.nextPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
    itemsController.nextPage(duration: Duration(seconds: 1), curve: Curves.decelerate);
    pentagonController.reset();
    pentagonController.forward();
    imageController.reset();
    imageController.forward();

  }
}