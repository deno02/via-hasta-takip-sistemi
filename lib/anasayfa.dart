import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hasta/background.dart';

import 'ayarlar.dart';
import 'charts.dart';
import 'yonetim.dart';

class anasayfa extends StatefulWidget {
  var anasayfaid;
  anasayfa({required this.anasayfaid});
  @override
  _anasayfaState createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  late String newid = widget.anasayfaid.toString();

  int index = 1;
  final items = <Widget>[
    Icon(Icons.computer, size: 30, color: Colors.white),
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.settings, size: 30, color: Colors.white),
  ];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StatefulWidget> screens = [
      yonetim(),
      charts(chartid: newid),
      //saglikGoruntule(),
      //deneme(),
      SettingsPage(),
    ];
    return Stack(
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          /*appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
              child: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Hasta Takip Uygulamasına Hoşgeldiniz!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Bu uygulama ile; \n ✓ Bilekliğinizdeki sağlık bilgilerinize ulaşabilir.\n ✓ Size özel sağlık bildirimlerini alabilir. \n ✓ Acil durum kişilerinize ulaşabilirsiniz.',
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Tamam'),
                            child: const Text('Tamam'),
                          ),
                        ],
                        scrollable: true,
                      ),
                    );
                  },
                  icon: Icon(Icons.add_alert),
                  color: Colors.deepOrangeAccent,
                  padding:
                      EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 0),
                ),
                FlatButton(
                    padding:
                        EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 0),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ayarlar(),
                        ),
                      );
                    },
                    child: Image.asset('images/a.jpg')),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),*/
          body: screens[index],

          /*Center(
            child: Text(
              '$index',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 120),
            ),
          ),*/

          /*Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Container(
                      child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => via(),
                        ),
                      );
                    },
                    child: Image.asset('images/via.png'),
                  )),
                  SizedBox(height: 50),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => saglikGoruntule(),
                        ),
                      );
                    },
                    textColor: Colors.black,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Sağlık Bilgilerini Görüntüle',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => yonetim(),
                        ),
                      );
                    },
                    textColor: Colors.black,
                    padding: const EdgeInsets.only(left: 58, right: 58),
                    child: Text(
                      'Yönetim Paneli Girişi',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          child: Text('© 2022 - Via Hasta Takip Sistemi'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          bottomNavigationBar: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.green,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.green,
            items: items,
            index: index,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) => setState(() {
              this.index = index;
            }),
          ),
        ),
      ],
    );
  }
}
