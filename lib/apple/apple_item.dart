
import 'package:flame/components.dart';
import 'package:game/main.dart';
import 'package:game/utils/home_screen_sizes.dart';

class AppleItem extends SpriteComponent {
  final HomeScreenSizes homeScreenParam;
  AppleItem(Sprite sprite,{required this.homeScreenParam}) {
    this.sprite = sprite;
    size = Vector2(50, 50);
    position = Vector2(homeScreenParam.x,homeScreenParam.y);
  }
}
