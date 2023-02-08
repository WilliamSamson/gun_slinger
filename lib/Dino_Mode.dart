import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StickManFightGame extends StatefulWidget {
  const StickManFightGame({super.key});

  @override
  _StickManFightGameState createState() => _StickManFightGameState();
}

class _StickManFightGameState extends State<StickManFightGame> {
  bool _playerBlocking = false;
  bool _opponentBlocking = false;
  int _playerHealth = 100;
  int _opponentHealth = 100;
  int _playerAttack = 10;
  int _opponentAttack = 15;
  int _playerAttackChance = 50;
  int _opponentAttackChance = 30;
  int _playerBlockChance = 30;
  int _opponentBlockChance = 50;
  Random _random = Random();

  void _playerBlock() {
    setState(() {
      _playerBlocking = true;
    });
  }

  void _playerAttack1() {
    setState(() {
      _playerBlocking = false;
      if (_random.nextInt(100) < _playerAttackChance) {
        _opponentHealth -= _playerAttack;
      }
    });
  }

  void _updateGame() {
    setState(() {
      _opponentBlocking = _random.nextInt(100) < _opponentBlockChance;
      if (!_opponentBlocking && _random.nextInt(100) < _opponentAttackChance) {
        if (!_playerBlocking) {
          _playerHealth -= _opponentAttack;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      _updateGame();
      if (_playerHealth <= 0 || _opponentHealth <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Player Health: $_playerHealth',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Opponent Health: $_opponentHealth',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: _playerBlock,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.yellow,
                ),
              ),
              GestureDetector(
                onTap: _playerAttack1,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
