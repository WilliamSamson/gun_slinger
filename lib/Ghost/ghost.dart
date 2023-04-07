// import 'package:flutter/material.dart';

// import '../Character layout/Character.dart';
// import '../Character layout/character_select.dart';

// class MyGhost extends StatelessWidget {
//   late String _backgroundImage;

//   MyGhost({super.key});

//   String _setImage() {
//     if (selectedGender == Gender.Male) {
//       _backgroundImage = 'assets/c.jpeg';
//     }
//      else if (selectedGender == Gender.Female) {
//       _backgroundImage = 'assets/b.png';
//     } else if (selectedGender == Gender.Female1) {
//       _backgroundImage = 'assets/e.jpeg';
//     } else if (selectedGender == Gender.Female2) {
//       _backgroundImage = 'assets/c.jpeg';
//     }

//     print("_backgroundImage: $_backgroundImage");
//     return _backgroundImage; // here it returns your _backgroundImage value
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(2),
//       child: Image.asset(
//         _setImage(),
//       ),
//     );
//   }
// }
