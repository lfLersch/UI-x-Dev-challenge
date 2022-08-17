import 'package:flutter/material.dart';

class Item{
  String name, image, size;
  late Path path;

  Item(this.name, this.image, this.size);

  setPath(Path path){
    this.path = path;
  }
}