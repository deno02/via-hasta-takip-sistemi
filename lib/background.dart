import 'package:flutter/material.dart';

class background extends StatelessWidget {
  const background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Container(
      width: screensize.width,
      height: screensize.height,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('images/c.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
