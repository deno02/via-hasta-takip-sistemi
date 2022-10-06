import 'package:flutter/material.dart';
import 'package:hasta/giris.dart';
import 'package:lottie/lottie.dart';

class girisluttie extends StatefulWidget {
  @override
  _girisluttieState createState() => _girisluttieState();
}

class _girisluttieState extends State<girisluttie>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late String yeniid;
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        controller.reset();
      }
    });
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'animation/gecis.json',
          animate: true,
          controller: controller,
          onLoaded: (composition) {
            controller.forward();
          },
        ),
      ),
    );
  }
}
