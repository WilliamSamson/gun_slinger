import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gun_slinger/Character%20layout/Character.dart';

import '../Dino World/main.dart';

class Select_Location extends StatefulWidget {
  const Select_Location({Key? key}) : super(key: key);

  @override
  State<Select_Location> createState() => _Select_LocationState();
}

class _Select_LocationState extends State<Select_Location> {
  bool isLukane = false;
  bool isDeathStorm = false;
  bool isSaramuko = false;
  bool isErnest = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromARGB(255, 92, 125, 138);
    Offset distanceMale =
        isLukane ? const Offset(10, 10) : const Offset(15, 15);
    double blurMale = isLukane ? 5 : 30;

    Offset distanceFemale =
        isDeathStorm ? const Offset(10, 10) : const Offset(15, 15);
    double blurFemale = isDeathStorm ? 5 : 30;

    Offset distanceFemale1 =
        isSaramuko ? const Offset(10, 10) : const Offset(15, 15);
    double blurFemale1 = isSaramuko ? 5 : 30;

    Offset distanceFemale2 =
        isErnest ? const Offset(10, 10) : const Offset(15, 15);
    double blurFemale2 = isErnest ? 5 : 30;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Characters1(),
                            ),
                          );

                          Color _color = Colors.black;
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
                          width: 6,
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
                        CustomCard4(size, context),
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
    // onTap: () => Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const App(),
    //   ),
    // ),
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 131, 166, 167),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              -3.142 / 2,
            ),
            child: Image.asset(
              'assets/Maps/location1.png',
              fit: BoxFit.contain,
              width: 400,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Cactus-Texas',
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

GestureDetector CustomCard2(Size size, context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp1(),
      ),
    ),
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              -3.142 / 2,
            ),
            child: Image.asset(
              'assets/Maps/dark-valley.jpg',
              fit: BoxFit.contain,
              width: 400,
            ),
          ),
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

GestureDetector CustomCard3(Size size, context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp1(),
      ),
    ),
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              -3.142 / 2,
            ),
            child: Image.asset(
              'assets/Maps/dark-valley.jpg',
              fit: BoxFit.contain,
              width: 400,
            ),
          ),
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

GestureDetector CustomCard4(Size size, context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp1(),
      ),
    ),
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              -3.142 / 2,
            ),
            child: Image.asset(
              'assets/Maps/dark-valley.jpg',
              fit: BoxFit.contain,
              width: 400,
            ),
          ),
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
