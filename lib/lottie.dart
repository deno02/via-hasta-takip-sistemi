import 'package:flutter/material.dart';
import 'package:hasta/anasayfa.dart';
import 'package:lottie/lottie.dart';

class luttie extends StatefulWidget {
  var id;
  luttie({required this.id});
  @override
  _luttieState createState() => _luttieState();
}

class _luttieState extends State<luttie> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late String yeniid;
  void initState() {
    print(widget.id);
    yeniid = widget.id.toString();
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => anasayfa(anasayfaid: yeniid)));
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
          'animation/geciss.json',
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
