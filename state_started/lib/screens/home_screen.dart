import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int defaultSeconds = 1500;
  int totalSeconds = defaultSeconds;
  int totalPomodoro = 0;
  late Timer timer;
  bool isPlaying = false;

  String format(int seconds) {
    Duration duration = Duration(seconds: seconds);
    return "$duration".split('.').first.substring(2, 7);
  }

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds == 0) {
        timer.cancel();
        isPlaying = false;
        totalSeconds = defaultSeconds;
        totalPomodoro += 1;
      } else {
        totalSeconds -= 1;
      }
    });
  }

  void onStartPress() {
    setState(() {
      isPlaying = true;
    });
    timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      onTick,
    );
  }

  void onStopPress() {
    setState(() {
      isPlaying = false;
      totalSeconds = defaultSeconds;
    });
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              format(totalSeconds),
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 89,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: IconButton(
              iconSize: 150,
              onPressed: isPlaying ? onStopPress : onStartPress,
              icon: Icon(
                isPlaying ? Icons.stop_circle : Icons.play_circle,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'pomodoro',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoro',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 58,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
