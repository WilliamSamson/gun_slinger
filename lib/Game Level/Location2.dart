
import 'package:flame/components.dart';

class World2 extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('world2.png');
    size = sprite!.originalSize;
    return super.onLoad();
  }
}