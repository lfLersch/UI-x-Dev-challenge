import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../Helper/AnimationHelper.dart';
import 'Item.dart';

class Combo {
  Item principal, other, another;
  String name;
  Color color;
  late AnimationController animationController;
  late Animation animation;

  Combo(this.name, this.color, this.principal, this.other, this.another);

  initComboAnimation(double width, double height, AnimationController animationController){
    this.animationController = animationController;
    this.principal.path = AnimationHelper.drawPath1(width, height);
    this.other.path = AnimationHelper.drawPath2(width, height);
    this.another.path = AnimationHelper.drawPath3(width, height);
  }

  setAnimation(Animation animation){
    this.animation = animation;
  }
}