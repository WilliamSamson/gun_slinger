import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gun_slinger/Character%20layout/Character.dart';

import 'Main.dart';

class Select_Location extends StatefulWidget {
  const Select_Location({
    Key? key,
  }) : super(key: key);

  @override
  State<Select_Location> createState() => _Select_LocationState();
}

class _Select_LocationState extends State<Select_Location> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Characters1(),
                            ),
                          );
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      ' Maps',
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 116, 116),
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    // width:,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CustomCard(size, context),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomCard2(size, context),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomCard3(size, context),
                        const SizedBox(
                          width: 8,
                        ),
                        // CustomCard4(size, context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Swipe to choose a different Location -->',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

GestureDetector CustomCard(Size size, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameWidget(
            game: MyGame(),
          ),
        ),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 225, 225),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 5,
        ),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Maps/location1.png',
            fit: BoxFit.contain,
            width: 400,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Texas-Cactus',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

GestureDetector CustomCard2(Size size, context) {
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const MyApp1(),
      //   ),
      // );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Maps/dark-valley.jpg',
            fit: BoxFit.contain,
            width: 400,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Dark-Valley -coming soon-',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

GestureDetector CustomCard3(Size size, context) {
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const MyApp1(),
      //   ),
      // );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 96, 163, 169),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Maps/york.jpg',
            fit: BoxFit.contain,
            width: 300,
          ),
          // Transform(
          //   alignment: Alignment.center,
          //   transform: Matrix4.rotationZ(
          //     -3.142 / 2,
          //   ),
          //   child: Image.asset(
          //     'assets/Maps/dark-valley.jpg',
          //     fit: BoxFit.contain,
          //     width: 400,
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'New York City -coming soon-',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

GestureDetector CustomCard4(Size size, context) {
  return GestureDetector(
    onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const MyApp1(),
      //     ),
      //   );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Maps/dark-valley.jpg',
            fit: BoxFit.contain,
            width: 400,
          ),
          // Transform(
          //   alignment: Alignment.center,
          //   transform: Matrix4.rotationZ(
          //     -3.142 / 2,
          //   ),
          //   child: Image.asset(
          //     'assets/Maps/dark-valley.jpg',
          //     fit: BoxFit.contain,
          //     width: 400,
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Dark-Valley',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
