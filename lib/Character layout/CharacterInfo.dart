import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gun_slinger/Character%20layout/Character.dart';

import '../menu.dart';
import 'character_select.dart';

class CharactersInfo extends StatefulWidget {
  const CharactersInfo({Key? key}) : super(key: key);

  @override
  State<CharactersInfo> createState() => _CharactersInfoState();
}

late Character selectedGender;

class _CharactersInfoState extends State<CharactersInfo> {
  bool isLukane = false;
  bool isDeathStorm = false;
  bool isSaramuko = false;
  bool isErnest = false;
  bool isPressed = false;

  bool _boolString = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 37, 27),
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
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      ' Fighters Bio',
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
                        const SizedBox(
                          width: 8,
                        ),
                        CustomCard5(size, context),
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
                  'Swipe to view different character -->',
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
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
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
        //alignment: AlignmentDirectional.center,
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

GestureDetector CustomCard2(Size size, context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog2(context),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 98, 26, 122),
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

GestureDetector CustomCard3(Size size, context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog3(context),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 42, 120, 44),
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
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog4(context),
      );
    },
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(248, 163, 32, 32),
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
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog4(context),
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

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.black,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          " James Bond's 007 status is legendary, but few know the origin of how he gained his 00 designation or how its meaning has changed over time. Bond has become synonymous with 007- those three numbers that denote his famous license to kill.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _buildPopupDialog2(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.black,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          "Death-Storm is not who I am. It's my job and I love it. Viewed from a certain angle, I can come off looking like quite the bad egg. A real villain. A mass-murdering psychopathic killer, even. But that depends on who's describing me. Dead men don't talk. They sure as hell don't gossip. I think I'm a heck of a good guy, actually. My name is William Stark. And I am here just for fun.\n - Death-Storm -",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Close',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}

Widget _buildPopupDialog3(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.black,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          " A living legend, he was once a respected hero, before he attacked the Dynasty and Heralds Dome, razing everything to the ground. Now, he has become an evil tyrant who is hated by everyone who suffered because of his deeds. He aims to one day return to the heart of his people, but must first train in the combat of legends to revive his former self. ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _buildPopupDialog4(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.black,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          "Ernest 3.0 , Cyborg was a promising strong teenage athlete named Ernest Egba, before an accident which injured him so severely, resulting in William Samson (a genius with a brilliant mind for technology and inventions)  replacing his damaged body parts with cybernetics to keep him alive. Therefore creating the World first Human Cybory.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        // Image.asset('assets/Ernest 3.0.jpg'),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Close'),
      ),
    ],
  );
}
