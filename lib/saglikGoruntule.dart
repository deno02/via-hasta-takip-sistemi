import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'background.dart';

class saglikGoruntule extends StatefulWidget {
  const saglikGoruntule({Key? key}) : super(key: key);

  @override
  _saglikGoruntuleState createState() => _saglikGoruntuleState();
}

class _saglikGoruntuleState extends State<saglikGoruntule> {
  final url = "http://mysql.via.tc:8080/veri.php";
  var _postsJson = [];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      print(jsonData);
      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Widget build(BuildContext context) {
    fetchPosts();
    return Stack(
      children: [
        background(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              'Sağlık Bilgileri',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: ListView.builder(
              itemCount: _postsJson.length,
              itemBuilder: (context, i) {
                final post = _postsJson[i];
                return Center(
                  child: Text(
                    "\n\n Sıcaklık: ${post["FEVER"]}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
