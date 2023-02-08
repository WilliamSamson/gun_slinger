// // import 'package:flutter/material.dart';

// // class HealthBar extends StatefulWidget {
// //   @override
// //   _HealthBarState createState() => _HealthBarState();
// // }

// // class _HealthBarState extends State<HealthBar> {
// //   int _health = 100;
// //   bool _gameOver = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _startCountdown();
// //   }

// //   void _startCountdown() async {
// //     while (_health > 0) {
// //       await Future.delayed(Duration(seconds: 1));
// //       setState(() {
// //         _health--;
// //       });
// //     }
// //     setState(() {
// //       _gameOver = true;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: _gameOver
// //             ? Text("Game Over")
// //             : Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Text("Health: $_health"),
// //                   SizedBox(
// //                     height: 20,
// //                     width: double.infinity,
// //                     child: Container(
// //                       color: Colors.red,
// //                       child: FractionallySizedBox(
// //                         widthFactor: _health / 100,
// //                         heightFactor: 1,
// //                         child: Container(color: Colors.green),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:async';

// // import 'package:flutter/material.dart';

// // class HealthBar extends StatefulWidget {
// //   @override
// //   _HealthBarState createState() => _HealthBarState();
// // }

// // class _HealthBarState extends State<HealthBar> {
// //   double _health = 1;

// //   @override
// //   void initState() {
// //     super.initState();
// //     const duration = Duration(seconds: 1);
// //     Timer.periodic(duration, (timer) {
// //       setState(() {
// //         _health -= 0.1;
// //       });
// //       if (_health == .0) {
// //         timer.cancel();
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: _health > .0
// //             ? Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Text(
// //                     'Health:',
// //                     style: Theme.of(context).textTheme.headline4,
// //                   ),
// //                   const SizedBox(
// //                     height: 10,
// //                   ),
// //                   LinearProgressIndicator(
// //                     value: _health,
// //                     valueColor:
// //                         const AlwaysStoppedAnimation<Color>(Colors.green),
// //                   ),
// //                 ],
// //               )
// //             : Text(
// //                 'Game Over',
// //                 style: Theme.of(context).textTheme.headline4,
// //               ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';

// class HeartHealthBar extends StatefulWidget {
//   final double size;
//   final double initialHealth;
//   final Duration duration;

//   const HeartHealthBar({
//     Key? key,
//     this.size = 100,
//     this.initialHealth = 1,
//     this.duration = const Duration(seconds: 1),
//   }) : super(key: key);

//   @override
//   _HeartHealthBarState createState() => _HeartHealthBarState();
// }

// class _HeartHealthBarState extends State<HeartHealthBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//     _animation = Tween<double>(
//       begin: widget.initialHealth,
//       end: 0,
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.size,
//       height: widget.size,
//       child: CustomPaint(
//         painter: _HeartHealthBarPainter(
//           animation: _animation,
//           size: widget.size,
//         ),
//       ),
//     );
//   }
// }

// class _HeartHealthBarPainter extends CustomPainter {
//   final Animation<double> animation;
//   final double size;

//   _HeartHealthBarPainter({
//     required this.animation,
//     required this.size,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(size.width / 2, size.height * 0.1)
//       ..cubicTo(
//         size.width * 0.2,
//         size.height * 0.2,
//         size.width * 0.2,
//         size.height * 0.7,
//         size.width / 2,
//         size.height * 0.9,
//       )
//       ..cubicTo(
//         size.width * 0.8,
//         size.height * 0.7,
//         size.width * 0.8,
//         size.height * 0.2,
//         size.width / 2,
//         size.height * 0.1,
//       );

//     final rect = Rect.fromLTWH(
//       0,
//       0,
//       size.width * animation.value,
//       size.height,
//     );

//    // final clipPath = Path.fromRect(rect);

//     //canvas.clipPath(clipPath);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(_HeartHealthBarPainter oldDelegate) {
//     return oldDelegate.animation.value != animation.value;
//   }
// }

import 'package:flutter/material.dart';


class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  int _batteryLevel = 100;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = Tween<double>(begin: 100, end: 0).animate(_animationController)
      ..addListener(() {
        setState(() {
          _batteryLevel = _animation.value.round();
        });
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _batteryLevel > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Battery Level:',
                  ),
                  LinearProgressIndicator(
                    value: _batteryLevel / 100,
                  ),
                  Text(
                    '$_batteryLevel%',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )
            : Text(
                'Game Over',
                style: Theme.of(context).textTheme.headline4,
              ),
      ),
    );
  }
}
