import 'dart:math' as math;
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame with HasTappableComponents {
  static const worldSize = 4096.0;

  late Player player;

  @override
  Future<void> onLoad() async {
    // Create the player and add it to the game
    player = Player(Vector2.all(worldSize / 2));
    add(player);

    // Create the ground and add it to the game
    final ground = Ground(Vector2.all(worldSize));
    add(ground);

    // Create some trees and add them to the game
    final rng = math.Random();
    for (var i = 0; i < 100; i++) {
      final position =
          Vector2(rng.nextDouble() * worldSize, rng.nextDouble() * worldSize);
      final tree = Tree(position);
      add(tree);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if (!event.handled) {
      final touchPoint = event.canvasPosition;
      add(Square(touchPoint));
    }
  }
}

class Player extends SpriteAnimationComponent with HasGameRef<MyGame> {
  static const speed = 300.0;

  Player(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(64),
        ) {
    final image = Flame.images.fromCache('assets/Game_View/Bond001/L1.png');
    final sprite = Sprite(image);
    animation = SpriteAnimation.spriteList(
      [sprite],
      stepTime: 0.15,
    );
  }

  @override
  void onGameResize(Vector2 gameSize) {
    // Call super method first to ensure the component is properly resized
    super.onGameResize(gameSize);

    // Update the player's position to be in the center of the screen
    position = gameSize / 2;
  }

  void moveToPosition(Vector2 position) {
    // Calculate the distance and duration for the movement
    final distance = (position - this.position).length;
    final duration = distance / speed;

    // Create a tween to move the player to the tapped position
    final tween = Tween<Vector2>(
      begin: this.position,
      end: position,
    ).chain(CurveTween(curve: Curves.linear));

    // Add the tween to the game's tween manager and play the animation
    gameRef.add(tween).then((_) => animation.stop());
    animation.play();
  }
}

class Ground extends SpriteComponent {
  Ground(Vector2 size)
      : super(
          sprite: Sprite('assets/images/ground.png'),
          size: size,
        );
}

class Tree extends SpriteComponent {
  Tree(Vector2 position)
      : super(
          position: position,
          sprite: Sprite('assets/images/cacti/cacti_ground.png'),
        );
}

class Square extends PositionComponent {
  static final _paint = Paint()..color = Colors.yellow;

  Square(Vector2 position) : super(position: position);

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(position.x, position.y, 50, 50),
      _paint,
    );
  }
}
