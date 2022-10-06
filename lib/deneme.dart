/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import 'background.dart';

class deneme extends StatefulWidget {
  String chartid;
  charts({required this.chartid});
  @override
  _denemeState createState() => _denemeState();
}

class _chartsState extends State<charts> {
  late String flutid;
  var bileklik;
  var sicaklik;
  var nabiz;
  var spo2;
  var dusme;
  var ihlal;
  var deneme;

  final url = "http://mysql.via.tc:8080/veri.php";
  var _postsJson = [];
  void fetchPosts() async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        'id': flutid,
      });
      final jsonData = await jsonDecode(response.body) as List;
      print(jsonData);
      setState(() {
        _postsJson = jsonData;
        final post = _postsJson[0];
        sicaklik = post["FEVER"];
        spo2 = post["OxygenDensity"];
        nabiz = post["HeartBeat"];
        dusme = post["FallDown"];
        ihlal = post["ZoneViolation"];
      });
    } catch (err) {}
  }

  @override
  void initState() {
    flutid = widget.chartid;
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
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('DÜŞME',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start),
                                if (dusme == 1)
                                  Lottie.asset(
                                    'animation/warning.json',
                                    animate: true,
                                  ),
                                if (dusme == 0)
                                  Icon(Icons.do_not_disturb,
                                      size: 50, color: Colors.white),
                              ],
                            ),
                            margin: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('BÖLGE İHLALİ',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.start),
                                if (ihlal == 1)
                                  Lottie.asset(
                                    'animation/warning.json',
                                    animate: true,
                                  ),
                                if (ihlal == 0)
                                  Icon(Icons.do_not_disturb,
                                      size: 50, color: Colors.white),
                              ],
                            ),
                            margin: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (sicaklik == 0)
                            Lottie.asset(
                              'animation/coldtemp.json',
                              animate: true,
                            ),
                          if (sicaklik == 34)
                            Lottie.asset(
                              'animation/okey.json',
                              animate: true,
                            ),
                          if (sicaklik == 35)
                            Lottie.asset(
                              'animation/okey.json',
                              animate: true,
                            ),
                          if (sicaklik == 36)
                            Lottie.asset(
                              'animation/okey.json',
                              animate: true,
                            ),
                          if (sicaklik == 37)
                            Lottie.asset(
                              'animation/okey.json',
                              animate: true,
                            ),
                          if (sicaklik == 38)
                            Lottie.asset(
                              'animation/hottemp.json',
                              animate: true,
                            ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('SICAKLIK',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start),
                              SizedBox(height: 10),
                              Text(sicaklik.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                  textAlign: TextAlign.start),
                            ],
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'animation/bpm.json',
                                animate: true,
                              ),
                              Text('NABIZ',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.start),
                              SizedBox(width: 40),
                              Text(nabiz.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                  textAlign: TextAlign.start),
                            ],
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/blood.png',
                                      width: 100,
                                      height: 200,
                                    ),
                                    Text('SPO2',
                                        style: TextStyle(
                                          fontSize: 35,
                                        ),
                                        textAlign: TextAlign.start),
                                    SizedBox(width: 40),
                                    Text(spo2.toString(),
                                        style: TextStyle(
                                          fontSize: 40,
                                        ),
                                        textAlign: TextAlign.start),
                                  ],
                                )
                              ],
                            ),
                            margin: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}*/
