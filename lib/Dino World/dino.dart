import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Character layout/Character.dart';
import '../Character layout/character_select.dart';
import 'constants.dart';
import 'game_object.dart';
import 'sprite.dart';
import 'player.dart';

late String _backgroundImage1;
late String _backgroundImage2;
late String _backgroundImage3;
late String _backgroundImage4;
late String _backgroundImage5;
late String _backgroundImage6;
late String _backgroundImage7;
late String _backgroundImage8;

String _setImage() {
  if (selectedGender == Gender.Male) {
    _backgroundImage1 = "assets/Game_View/Bond001/L1.png";
    _backgroundImage2 = "assets/Game_View/Bond001/L2.png";
    _backgroundImage3 = "assets/Game_View/Bond001/L3.png";
    _backgroundImage4 = "assets/Game_View/Bond001/L4.png";
    _backgroundImage5 = "assets/Game_View/Bond001/L5.png";
    _backgroundImage6 = "assets/Game_View/Bond001/L6.png";
    _backgroundImage7 = "assets/Game_View/Bond001/L7.png";
    _backgroundImage8 = "assets/Game_View/Bond001/L8.png";
  } else if (selectedGender == Gender.Female) {
    _backgroundImage = 'assets/c.jpeg';
  } else if (selectedGender == Gender.Female1) {
    _backgroundImage = 'assets/d.jpeg';
  } else if (selectedGender == Gender.Female2) {
    _backgroundImage = 'assets/e.jpeg';
  }

  print(
    "_backgroundImage: $_backgroundImage1, $_backgroundImage2, $_backgroundImage3, $_backgroundImage4,$_backgroundImage5, $_backgroundImage6, $_backgroundImage7, $_backgroundImage8 ",
  );

  return List [
 _backgroundImage1;
  ] // here it returns your _backgroundImage value
}

List<Sprite> dino = [
  Sprite()
    ..imagePath = _backgroundImage1
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "assets/images/dino/dino_2.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "assets/images/dino/dino_3.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "assets/images/dino/dino_4.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "assets/images/dino/dino_5.png"
    ..imageWidth = 88
    ..imageHeight = 94,
  Sprite()
    ..imagePath = "assets/images/dino/dino_6.png"
    ..imageWidth = 88
    ..imageHeight = 94,
];

enum DinoState {
  jumping,
  running,
  dead,
}

class Dino extends GameObject {
  Sprite currentSprite = dino[0];
  double dispY = 0;
  double velY = 0;
  DinoState state = DinoState.running;

  @override
  Widget render() {
    return Image.asset(currentSprite.imagePath);
  }

  @override
  Rect getRect(Size screenSize, double runDistance) {
    return Rect.fromLTWH(
      screenSize.width / 10,
      screenSize.height / 1.75 - currentSprite.imageHeight - dispY,
      currentSprite.imageWidth.toDouble(),
      currentSprite.imageHeight.toDouble(),
    );
  }

  @override
  void update(Duration lastUpdate, Duration? elapsedTime) {
    double elapsedTimeSeconds;
    try {
      currentSprite = dino[(elapsedTime!.inMilliseconds / 100).floor() % 2 + 2];
    } catch (_) {
      currentSprite = dino[0];
    }
    try {
      elapsedTimeSeconds = (elapsedTime! - lastUpdate).inMilliseconds / 1000;
    } catch (_) {
      elapsedTimeSeconds = 0;
    }

    dispY += velY * elapsedTimeSeconds;
    if (dispY <= 0) {
      dispY = 0;
      velY = 0;
      state = DinoState.running;
    } else {
      velY -= gravity * elapsedTimeSeconds;
    }
  }

  void jump() {
    if (state != DinoState.jumping) {
      state = DinoState.jumping;
      velY = jumpVelocity;
    }
  }

  void die() {
    currentSprite = dino[5];
    state = DinoState.dead;
  }
}
