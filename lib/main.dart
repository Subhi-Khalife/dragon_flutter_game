library main;

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:game/apple/apple_collision.dart';
import 'package:game/apple/apple_item.dart';
import 'package:game/dragon/dragon_actros.dart';
import 'package:game/utils/home_screen_component.dart';
import 'package:game/utils/home_screen_sizes.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with HasDraggableComponents, HasCollisionDetection {
  late HomeScreenSizes homeScreenParam;
  late HomeScreenComponent homeScreenComponent;
  late final DragonCollision player;
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    player.x += event.delta.x;
    player.y += event.delta.y;
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.x += 1;
  }

  @override
  Future<void> onLoad() async {
    homeScreenParam = HomeScreenSizes(sizeWidth: size[0], sizeHeight: size[1]);
    homeScreenParam.updateApplePosition();
    final sprites = [0, 1, 2, 3].map((i) => Sprite.load('frame-${i + 1}.png'));
    final parallaxComponent = await loadParallaxComponent([
      ParallaxImageData('garden.jpg'),
    ]);
    homeScreenComponent = HomeScreenComponent(
      appleItem: AppleItem(
        await Sprite.load('apple.png'),
        homeScreenParam: homeScreenParam,
      ),
      appleCollision: AppleCollision(
        position: Vector2(homeScreenParam.x, homeScreenParam.y),
        size: Vector2.all(64.0),
      ),
    );

    add(parallaxComponent);
    add(homeScreenComponent.appleItem);
    add(homeScreenComponent.appleCollision);
    final animation = SpriteAnimation.spriteList(
      await Future.wait(sprites),
      stepTime: 0.10,
    );
    player = DragonCollision(
      animation,
      Vector2.all(64.0),
      homeScreenParam: homeScreenParam,
      homeScreenComponent: homeScreenComponent,
    );
    add(player);
  }
}
