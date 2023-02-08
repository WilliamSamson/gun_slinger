// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:gun_slinger/Ghost/ghost.dart';
// import 'package:gun_slinger/Ghost/ghost3.dart';
// import 'package:gun_slinger/Ghost/ghost2.dart';
// import 'package:gun_slinger/Layout/path.dart';
// import 'package:gun_slinger/Layout/pixel.dart';
// import 'package:gun_slinger/player.dart';

// class Location4 extends StatefulWidget {
//   const Location4({super.key});

//   @override
//   _Location4State createState() => _Location4State();
// }

// class _Location4State extends State<Location4> {
//   static int numberInRow = 11;
//   int numberOfSquares = numberInRow * 16;
//   int player = numberInRow * 14 + 1;
//   int ghost = numberInRow * 2 - 2;
//   int ghost2 = numberInRow * 9 - 1;
//   int ghost3 = numberInRow * 11 - 2;
//   bool preGame = true;
//   bool mouthClosed = false;
//   var controller;
//   int score = 0;
//   bool paused = false;
//   // AudioPlayer advancedPlayer = new AudioPlayer();
//   // AudioPlayer advancedPlayer2 = new AudioPlayer();
//   // AudioCache audioInGame = new AudioCache(prefix: 'assets/');
//   // AudioCache audioMunch = new AudioCache(prefix: 'assets/');
//   // AudioCache audioDeath = new AudioCache(prefix: 'assets/');
//   // AudioCache audioPaused = new AudioCache(prefix: 'assets/');

//   List<int> barriers = [
//     0,
//     1,
//     2,
//     3,
//     4,
//     5,
//     6,
//     7,
//     8,
//     9,
//     10,
//     11,
//     21,
//     22,
//     32,
//     33,
//     43,
//     44,
//     54,
//     55,
//     65,
//     66,
//     76,
//     77,
//     87,
//     88,
//     98,
//     99,
// //////
//     108,
//     107,
//     104,
//     103,
//     102,
//     74,
//     73,
// /////

//     109,
//     110,
//     120,
//     121,
//     131,
//     132,
//     142,
//     143,

//     145,
//     146,
//     147,
//     148,
// ////////////////
//     137,
//     138,
//     78,
//     79,
//     80,
//     53,
//     52,
//     51,
//     50,
//     25,
//     34,
//     35,
//     36,
// ///////////////

//     153,
//     154,
//     164,
//     165,
//     166,
//     167,
//     168,
//     169,
//     170,
//     171,
//     172,
//     173,
//     174,
//     175,
//   ];

//   List<int> food = [];
//   String direction = "right";
//   String ghostLast = "left";
//   String ghostLast2 = "left";
//   String ghostLast3 = "down";

//   void startGame() {
//     if (preGame) {
//       // advancedPlayer = new AudioPlayer();
//       // audioInGame = new AudioCache(fixedPlayer: advancedPlayer);
//       // audioPaused = new AudioCache(fixedPlayer: advancedPlayer2);
//       // audioInGame.loop('pacman_beginning.wav');
//       preGame = false;
//       getFood();

//       Timer.periodic(const Duration(milliseconds: 10), (timer) {
//         if (paused) {
//         } else {
//           // advancedPlayer.resume();
//         }
//         if (player == ghost || player == ghost2 || player == ghost3) {
//           // advancedPlayer.stop();
//           // audioDeath.play('pacman_death.wav');
//           setState(() {
//             player = -1;
//           });
//           showDialog(
//               barrierDismissible: false,
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Center(child: Text("Game Over!")),
//                   content: Text("Your Score : $score"),
//                   actions: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // audioInGame.loop('pacman_beginning.wav');
//                         setState(() {
//                           player = numberInRow * 14 + 1;
//                           ghost = numberInRow * 2 - 2;
//                           ghost2 = numberInRow * 9 - 1;
//                           ghost3 = numberInRow * 11 - 2;
//                           paused = false;
//                           preGame = false;
//                           mouthClosed = false;
//                           direction = "right";
//                           food.clear();
//                           getFood();
//                           score = 0;
//                           Navigator.pop(context);
//                         });
//                       },
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: <Color>[
//                               Color(0xFF0D47A1),
//                               Color(0xFF1976D2),
//                               Color(0xFF42A5F5),
//                             ],
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(10.0),
//                         child: const Text('Restart'),
//                       ),
//                     )
//                   ],
//                 );
//               });
//         }
//       });
//       Timer.periodic(const Duration(milliseconds: 190), (timer) {
//         if (!paused) {
//           moveGhost();
//           moveGhost2();
//           moveGhost3();
//         }
//       });
//       Timer.periodic(const Duration(milliseconds: 170), (timer) {
//         setState(() {
//           mouthClosed = !mouthClosed;
//         });
//         if (food.contains(player)) {
//           // audioMunch.play('pacman_chomp.wav');
//           setState(() {
//             food.remove(player);
//           });
//           score++;
//         }

//         // if (player == ghost || player == ghost2 || player == ghost3) {
//         //   setState(() {
//         //     player = -1;
//         //   });
//         //   showDialog(
//         //       context: context,
//         //       builder: (BuildContext context) {
//         //         return AlertDialog(
//         //           title: Center(child: Text("Game Over!")),
//         //           content: Text("Your Score : " + (score).toString()),
//         //           actions: [
//         //             RaisedButton(
//         //               onPressed: () {
//         //                 setState(() {
//         //                   player = numberInRow * 14 + 1;
//         //                   ghost = numberInRow * 2 - 2;
//         //                   ghost2 = numberInRow * 9 - 1;
//         //                   ghost3 = numberInRow * 11 - 2;
//         //                   preGame = false;
//         //                   mouthClosed = false;
//         //                   direction = "right";
//         //                   food.clear();
//         //                   getFood();
//         //                   score = 0;
//         //                   Navigator.pop(context);
//         //                 });
//         //               },
//         //               textColor: Colors.white,
//         //               padding: const EdgeInsets.all(0.0),
//         //               child: Container(
//         //                 decoration: const BoxDecoration(
//         //                   gradient: LinearGradient(
//         //                     colors: <Color>[
//         //                       Color(0xFF0D47A1),
//         //                       Color(0xFF1976D2),
//         //                       Color(0xFF42A5F5),
//         //                     ],
//         //                   ),
//         //                 ),
//         //                 padding: const EdgeInsets.all(10.0),
//         //                 child: const Text('Restart'),
//         //               ),
//         //             )
//         //           ],
//         //         );
//         //       });
//         // }
//         switch (direction) {
//           case "left":
//             if (!paused) moveLeft();
//             break;
//           case "right":
//             if (!paused) moveRight();
//             break;
//           case "up":
//             if (!paused) moveUp();
//             break;
//           case "down":
//             if (!paused) moveDown();
//             break;
//         }
//       });
//     }
//   }

//   void restart() {
//     startGame();
//   }

//   void getFood() {
//     for (int i = 0; i < numberOfSquares; i++)
//       if (!barriers.contains(i)) {
//         food.add(i);
//       }
//   }

//   void moveLeft() {
//     if (!barriers.contains(player - 1)) {
//       setState(() {
//         player--;
//       });
//     }
//   }

//   void moveRight() {
//     if (!barriers.contains(player + 1)) {
//       setState(() {
//         player++;
//       });
//     }
//   }

//   void moveUp() {
//     if (!barriers.contains(player - numberInRow)) {
//       setState(() {
//         player -= numberInRow;
//       });
//     }
//   }

//   void moveDown() {
//     if (!barriers.contains(player + numberInRow)) {
//       setState(() {
//         player += numberInRow;
//       });
//     }
//   }

//   void moveGhost() {
//     switch (ghostLast) {
//       case "left":
//         if (!barriers.contains(ghost - 1)) {
//           setState(() {
//             ghost--;
//           });
//         } else {
//           if (!barriers.contains(ghost + numberInRow)) {
//             setState(() {
//               ghost += numberInRow;
//               ghostLast = "down";
//             });
//           } else if (!barriers.contains(ghost + 1)) {
//             setState(() {
//               ghost++;
//               ghostLast = "right";
//             });
//           } else if (!barriers.contains(ghost - numberInRow)) {
//             setState(() {
//               ghost -= numberInRow;
//               ghostLast = "up";
//             });
//           }
//         }
//         break;
//       case "right":
//         if (!barriers.contains(ghost + 1)) {
//           setState(() {
//             ghost++;
//           });
//         } else {
//           if (!barriers.contains(ghost - numberInRow)) {
//             setState(() {
//               ghost -= numberInRow;
//               ghostLast = "up";
//             });
//           } else if (!barriers.contains(ghost + numberInRow)) {
//             setState(() {
//               ghost += numberInRow;
//               ghostLast = "down";
//             });
//           } else if (!barriers.contains(ghost - 1)) {
//             setState(() {
//               ghost--;
//               ghostLast = "left";
//             });
//           }
//         }
//         break;
//       case "up":
//         if (!barriers.contains(ghost - numberInRow)) {
//           setState(() {
//             ghost -= numberInRow;
//             ghostLast = "up";
//           });
//         } else {
//           if (!barriers.contains(ghost + 1)) {
//             setState(() {
//               ghost++;
//               ghostLast = "right";
//             });
//           } else if (!barriers.contains(ghost - 1)) {
//             setState(() {
//               ghost--;
//               ghostLast = "left";
//             });
//           } else if (!barriers.contains(ghost + numberInRow)) {
//             setState(() {
//               ghost += numberInRow;
//               ghostLast = "down";
//             });
//           }
//         }
//         break;
//       case "down":
//         if (!barriers.contains(ghost + numberInRow)) {
//           setState(() {
//             ghost += numberInRow;
//             ghostLast = "down";
//           });
//         } else {
//           if (!barriers.contains(ghost - 1)) {
//             setState(() {
//               ghost--;
//               ghostLast = "left";
//             });
//           } else if (!barriers.contains(ghost + 1)) {
//             setState(() {
//               ghost++;
//               ghostLast = "right";
//             });
//           } else if (!barriers.contains(ghost - numberInRow)) {
//             setState(() {
//               ghost -= numberInRow;
//               ghostLast = "up";
//             });
//           }
//         }
//         break;
//     }
//   }

//   void moveGhost2() {
//     switch (ghostLast2) {
//       case "left":
//         if (!barriers.contains(ghost2 - 1)) {
//           setState(() {
//             ghost2--;
//           });
//         } else {
//           if (!barriers.contains(ghost2 + numberInRow)) {
//             setState(() {
//               ghost2 += numberInRow;
//               ghostLast2 = "down";
//             });
//           } else if (!barriers.contains(ghost2 + 1)) {
//             setState(() {
//               ghost2++;
//               ghostLast2 = "right";
//             });
//           } else if (!barriers.contains(ghost2 - numberInRow)) {
//             setState(() {
//               ghost2 -= numberInRow;
//               ghostLast2 = "up";
//             });
//           }
//         }
//         break;
//       case "right":
//         if (!barriers.contains(ghost2 + 1)) {
//           setState(() {
//             ghost2++;
//           });
//         } else {
//           if (!barriers.contains(ghost2 - numberInRow)) {
//             setState(() {
//               ghost2 -= numberInRow;
//               ghostLast2 = "up";
//             });
//           } else if (!barriers.contains(ghost2 + numberInRow)) {
//             setState(() {
//               ghost2 += numberInRow;
//               ghostLast2 = "down";
//             });
//           } else if (!barriers.contains(ghost2 - 1)) {
//             setState(() {
//               ghost2--;
//               ghostLast2 = "left";
//             });
//           }
//         }
//         break;
//       case "up":
//         if (!barriers.contains(ghost2 - numberInRow)) {
//           setState(() {
//             ghost2 -= numberInRow;
//             ghostLast2 = "up";
//           });
//         } else {
//           if (!barriers.contains(ghost2 + 1)) {
//             setState(() {
//               ghost2++;
//               ghostLast2 = "right";
//             });
//           } else if (!barriers.contains(ghost2 - 1)) {
//             setState(() {
//               ghost2--;
//               ghostLast2 = "left";
//             });
//           } else if (!barriers.contains(ghost2 + numberInRow)) {
//             setState(() {
//               ghost2 += numberInRow;
//               ghostLast2 = "down";
//             });
//           }
//         }
//         break;
//       case "down":
//         if (!barriers.contains(ghost2 + numberInRow)) {
//           setState(() {
//             ghost2 += numberInRow;
//             ghostLast2 = "down";
//           });
//         } else {
//           if (!barriers.contains(ghost2 - 1)) {
//             setState(() {
//               ghost2--;
//               ghostLast2 = "left";
//             });
//           } else if (!barriers.contains(ghost2 + 1)) {
//             setState(() {
//               ghost2++;
//               ghostLast2 = "right";
//             });
//           } else if (!barriers.contains(ghost2 - numberInRow)) {
//             setState(() {
//               ghost2 -= numberInRow;
//               ghostLast2 = "up";
//             });
//           }
//         }
//         break;
//     }
//   }

//   void moveGhost3() {
//     switch (ghostLast) {
//       case "left":
//         if (!barriers.contains(ghost3 - 1)) {
//           setState(() {
//             ghost3--;
//           });
//         } else {
//           if (!barriers.contains(ghost3 + numberInRow)) {
//             setState(() {
//               ghost3 += numberInRow;
//               ghostLast3 = "down";
//             });
//           } else if (!barriers.contains(ghost3 + 1)) {
//             setState(() {
//               ghost3++;
//               ghostLast3 = "right";
//             });
//           } else if (!barriers.contains(ghost3 - numberInRow)) {
//             setState(() {
//               ghost3 -= numberInRow;
//               ghostLast3 = "up";
//             });
//           }
//         }
//         break;
//       case "right":
//         if (!barriers.contains(ghost3 + 1)) {
//           setState(() {
//             ghost3++;
//           });
//         } else {
//           if (!barriers.contains(ghost3 - numberInRow)) {
//             setState(() {
//               ghost3 -= numberInRow;
//               ghostLast3 = "up";
//             });
//           } else if (!barriers.contains(ghost3 - 1)) {
//             setState(() {
//               ghost3--;
//               ghostLast3 = "left";
//             });
//           } else if (!barriers.contains(ghost3 + numberInRow)) {
//             setState(() {
//               ghost3 += numberInRow;
//               ghostLast3 = "down";
//             });
//           }
//         }
//         break;
//       case "up":
//         if (!barriers.contains(ghost3 - numberInRow)) {
//           setState(() {
//             ghost3 -= numberInRow;
//             ghostLast3 = "up";
//           });
//         } else {
//           if (!barriers.contains(ghost3 + 1)) {
//             setState(() {
//               ghost3++;
//               ghostLast3 = "right";
//             });
//           } else if (!barriers.contains(ghost3 - 1)) {
//             setState(() {
//               ghost3--;
//               ghostLast3 = "left";
//             });
//           } else if (!barriers.contains(ghost3 + numberInRow)) {
//             setState(() {
//               ghost3 += numberInRow;
//               ghostLast3 = "down";
//             });
//           }
//         }
//         break;
//       case "down":
//         if (!barriers.contains(ghost3 + numberInRow)) {
//           setState(() {
//             ghost3 += numberInRow;
//             ghostLast3 = "down";
//           });
//         } else {
//           if (!barriers.contains(ghost3 - 1)) {
//             setState(() {
//               ghost3--;
//               ghostLast3 = "left";
//             });
//           } else if (!barriers.contains(ghost3 + 1)) {
//             setState(() {
//               ghost3++;
//               ghostLast3 = "right";
//             });
//           } else if (!barriers.contains(ghost3 - numberInRow)) {
//             setState(() {
//               ghost3 -= numberInRow;
//               ghostLast3 = "up";
//             });
//           }
//         }
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Expanded(
//               flex:
//                   (MediaQuery.of(context).size.height.toInt() * 0.0139).toInt(),
//               child: GestureDetector(
//                 onVerticalDragUpdate: (details) {
//                   if (details.delta.dy > 0) {
//                     direction = "down";
//                   } else if (details.delta.dy < 0) {
//                     direction = "up";
//                   }
//                   // print(direction);
//                 },
//                 onHorizontalDragUpdate: (details) {
//                   if (details.delta.dx > 0) {
//                     direction = "right";
//                   } else if (details.delta.dx < 0) {
//                     direction = "left";
//                   }
//                   // print(direction);
//                 },
//                 child: Container(
//                   child: GridView.builder(
//                     padding:
//                         (MediaQuery.of(context).size.height.toInt() * 0.0139)
//                                     .toInt() >
//                                 10
//                             ? const EdgeInsets.only(top: 80)
//                             : const EdgeInsets.only(top: 20),
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: numberOfSquares,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: numberInRow),
//                     itemBuilder: (BuildContext context, int index) {
//                       if (player == index) {
//                         switch (direction) {
//                           case "left":
//                             return Transform.rotate(
//                               angle: pi,
//                               child: MyPlayer(),
//                             );
//                             break;
//                           case "right":
//                             return MyPlayer();
//                             break;
//                           case "up":
//                             return Transform.rotate(
//                               angle: 3 * pi / 2,
//                               child: MyPlayer(),
//                             );
//                             break;
//                           case "down":
//                             return Transform.rotate(
//                               angle: pi / 2,
//                               child: MyPlayer(),
//                             );
//                             break;
//                           default:
//                             return MyPlayer();
//                         }
//                       } else if (ghost == index) {
//                         return MyGhost();
//                       } else if (ghost2 == index) {
//                         return MyGhost2();
//                       } else if (ghost3 == index) {
//                         return MyGhost3();
//                       } else if (barriers.contains(index)) {
//                         return MyPixel(
//                           innerColor: Color.fromARGB(255, 161, 38, 13),
//                           outerColor: Color.fromARGB(255, 192, 138, 21),
//                           // child: Text(index.toString()),
//                         );
//                       } else if (preGame || food.contains(index)) {
//                         return MyPath(
//                           innerColor: Colors.yellow,
//                           outerColor: Colors.black,
//                           // child: Text(index.toString()),
//                         );
//                       } else {
//                         return MyPath(
//                           innerColor: Colors.black,
//                           outerColor: Colors.black,
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       " Score : $score",
//                       // // (MediaQuery.of(context).size.height.toInt() * 0.0139)
//                       //     .toInt()
//                       //     .toString(),
//                       style: const TextStyle(color: Colors.white, fontSize: 23),
//                     ),
//                     GestureDetector(
//                       onTap: startGame,
//                       child: const Text("P L A Y",
//                           style: TextStyle(color: Colors.white, fontSize: 23)),
//                     ),
//                     if (!paused)
//                       GestureDetector(
//                         child: const Icon(
//                           Icons.pause,
//                           color: Colors.white,
//                         ),
//                         onTap: () => {
//                           if (!paused)
//                             {
//                               paused = true,
//                               // advancedPlayer.pause(),
//                               // audioPaused.loop('pacman_intermission.wav'),
//                             }
//                           else
//                             {
//                               paused = false,
//                               // advancedPlayer2.stop(),
//                             },
//                           const Icon(
//                             Icons.play_arrow,
//                             color: Colors.white,
//                           )
//                         },
//                       ),
//                     if (paused)
//                       GestureDetector(
//                         child: const Icon(
//                           Icons.play_arrow,
//                           color: Colors.white,
//                         ),
//                         onTap: () => {
//                           if (paused)
//                             {
//                               paused = false,
//                               // advancedPlayer2.stop()
//                             }
//                           else
//                             {
//                               paused = true,
//                               // advancedPlayer.pause(),
//                               // audioPaused.loop('pacman_intermission.wav'),
//                             },
//                         },
//                       ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
