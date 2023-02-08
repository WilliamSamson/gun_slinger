import 'package:flutter/material.dart';

import '../Character layout/Character.dart';
import '../Character layout/character_select.dart';

class MyGhost3 extends StatelessWidget {
  late String _backgroundImage;
  MyGhost3({super.key});

  String _setImage() {
    if (selectedGender == Gender.Male) {
      _backgroundImage = 'assets/e.jpeg';
    } else if (selectedGender == Gender.Female) {
      _backgroundImage = 'assets/e.jpeg';
    } else if (selectedGender == Gender.Female1) {
      _backgroundImage = 'assets/c.jpeg';
    } else if (selectedGender == Gender.Female2) {
      _backgroundImage = 'assets/b.png';
    }

    print("_backgroundImage: $_backgroundImage");
    return _backgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Image.asset(
        _setImage(),
      ),
    );
  }
}
