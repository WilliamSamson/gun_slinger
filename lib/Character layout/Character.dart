import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gun_slinger/Game%20Level/Select.dart';

import 'package:gun_slinger/menu.dart';

class Characters1 extends StatefulWidget {
  const Characters1({Key? key}) : super(key: key);

  @override
  State<Characters1> createState() => _CharactersState();
}

class _CharactersState extends State<Characters1> {
  var secondaryColor = const Color.fromARGB(255, 34, 50, 77);
  var primaryColor = const Color.fromARGB(255, 14, 21, 24);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
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
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Menu(),
                            ),
                          );
                          Color _color = Colors.black;
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        ' Select your Player',
                        style: TextStyle(
                          color: Color.fromARGB(255, 111, 106, 106),
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
                          CustomCard(
                            size,
                            context,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomCard2(
                            size,
                            context,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomCard3(
                            size,
                            context,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomCard4(
                            size,
                            context,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomCard5(
                            size,
                            context,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Swipe to choose a different character -->',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector CustomCard(
  Size size,
  context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Select_Location(),
        ),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(245, 10, 15, 40),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/Players/007.jpg',
            fit: BoxFit.contain,
            width: 320,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'B-O-N-D 007',
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

GestureDetector CustomCard2(
  Size size,
  context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Select_Location(),
        ),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 84, 20, 105),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Players/batman.jpg',
            fit: BoxFit.contain,
            width: 320,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Dark Knight',
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

GestureDetector CustomCard3(
  Size size,
  context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Select_Location(),
        ),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 42, 120, 44),
          width: 5,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Players/Fred.jpg',
            fit: BoxFit.contain,
            width: 320,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Fred D Zombie ',
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Select_Location(),
        ),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(248, 163, 32, 32),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Players/prime.jpg',
            fit: BoxFit.contain,
            width: 320,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Optimus Prime',
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

GestureDetector CustomCard5(Size size, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Select_Location(),
        ),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.yellow,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        //alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/Players/Homer.jpg',
            fit: BoxFit.contain,
            width: 320,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 170),
            child: Text(
              'Mr Simpson',
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
