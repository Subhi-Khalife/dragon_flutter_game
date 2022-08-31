import 'package:flutter/cupertino.dart';
import 'package:game/apple/apple_collision.dart';
import 'package:game/apple/apple_item.dart';

class HomeScreenComponent {
  final AppleItem appleItem;
  final AppleCollision appleCollision;
  HomeScreenComponent({
    required this.appleItem,
    required this.appleCollision,
  });
}
