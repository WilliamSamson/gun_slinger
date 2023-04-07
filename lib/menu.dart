import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gun_slinger/Character%20layout/Character.dart';
import 'package:gun_slinger/Character%20layout/CharacterInfo.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShowCaseWidget(
          onStart: (index, key) {
            log('onStart: $index, $key');
          },
          onComplete: (index, key) {
            log('onComplete: $index, $key');
            if (index == 4) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle.light.copyWith(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
              );
            }
          },
          blurValue: 1,
          builder: Builder(builder: (context) => const MenuPage(title: '')),
          autoPlayDelay: const Duration(seconds: 3),
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.title});

  final String title;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  bool isFinished = false;
  bool _canShowButton = true;
  bool show1 = true;
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();

  final _controller = ScrollController();

  init() {
    (WidgetsBinding.instance).addPostFrameCallback(
      (_) {
        _isFirstLaunch().then((success) {
          if (success) {
            ShowCaseWidget.of(context).startShowCase([
              _one,
              _two,
              _three,
              _four,
              _five,
            ]);
          }
        });
      },
    );

    setState(() {
      isFinished = false;
    });
  }

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  void _doSomething() {
    setState(() {
      _boolString = false;
      _color = Colors.black;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _boolString = true;
  Color _color = const Color.fromARGB(255, 47, 45, 45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 360,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/samurai1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [Colors.black, Colors.black.withOpacity(.3)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 45,
                                    ),
                                    Visibility(
                                        visible: _boolString,
                                        child: Column(
                                          children: const [
                                            Text(
                                              'Combat of Legends ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '-The Race to Victory-',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SwipeableButtonView(
                                      buttonText: 'Battle',
                                      buttontextstyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      buttonWidget: const Icon(
                                        FontAwesomeIcons.fire,
                                        color: Color.fromARGB(255, 177, 30, 19),
                                      ),
                                      activeColor: _color,
                                      isFinished: isFinished,
                                      onWaitingProcess: () {
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          setState(() {
                                            isFinished = true;
                                            _boolString = false;
                                            _color = Colors.black;
                                          });
                                        });
                                      },
                                      onFinish: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Characters1(),
                                          ),
                                        );
                                        _color = Colors.black;
                                        _boolString = false;
                                        isFinished = false;
                                        //TODO: For reverse ripple effect animation
                                        setState(() {});
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Visibility(
                                      visible: _boolString,
                                      child: TextButton(
                                        style: const ButtonStyle(
                                            //  backgroundColor: Color.fromARGB(a, r, g, b)
                                            ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CharactersInfo(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Fighters',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        //  ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Visibility(
                                      visible: _boolString,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              // color: Color.fromARGB(255, 146, 5, 15),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                              color: Colors.white,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          _buildPopupDialog(
                                                              context),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.info_outline,
                                                size: 40,
                                                //  color: Color.fromARGB(255, 27, 145, 88),
                                              ),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Visibility(
                                      visible: _boolString,
                                      child: const Text(
                                        '-Brought to you by WS Corp-  ',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.black,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          "-Welcome to Combat of Legends- \nYour goal is to make it across dangerous lands in time for the ultimate combat of legends, to prove yourself as the ultimate combat champion in a vast multiverse of legends. The task ahead wont be easy, so get ready to tap your way to victory.",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Future<bool> _isFirstLaunch() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isFirstLaunch = sharedPreferences
          .getBool('IsFirstLaunchPage.PREFERENCES_IS_FIRST_LAUNCH_STRING') ??
      true;

  if (isFirstLaunch) {
    sharedPreferences.setBool(
        'IsFirstLaunchPage.PREFERENCES_IS_FIRST_LAUNCH_STRING', false);
  }

  return isFirstLaunch;
}
