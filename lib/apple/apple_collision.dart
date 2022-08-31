import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class AppleCollision extends PositionComponent {
  AppleCollision({required size, required position}) : super(size: size, position: position);
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }
}
