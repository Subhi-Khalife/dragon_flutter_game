import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game/main.dart';
import 'package:game/utils/home_screen_component.dart';
import 'package:game/utils/home_screen_sizes.dart';
export 'package:game/main.dart';

class DragonCollision extends SpriteAnimationComponent with CollisionCallbacks, HasGameRef<MyGame> {
  final HomeScreenSizes homeScreenParam;
  final HomeScreenComponent homeScreenComponent;
  DragonCollision(
    animation,
    size, {
    required this.homeScreenParam,
    required this.homeScreenComponent,
  }) : super(animation: animation, size: size);
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    homeScreenParam.updateApplePosition();
    size.x += 10;
    size.y += 10;
    homeScreenComponent.appleCollision.position = Vector2(homeScreenParam.x, homeScreenParam.y);
    homeScreenComponent.appleItem.position = Vector2(homeScreenParam.x, homeScreenParam.y);
  }
}
