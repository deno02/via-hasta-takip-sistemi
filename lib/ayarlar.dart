import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hasta/giris.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'notificationService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(SettingsPage());
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  final Color activeColor = Color.fromARGB(255, 52, 199, 89);
  bool _isObscure = true;
  bool isOn = false;
  bool isOn1 = false;
  bool isOn2 = false;
  bool isOn3 = false;
  int alarmId = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Ayarlar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Hasta Takip Sistemi',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Hasta Takip Uygulamasına Hoşgeldiniz!",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                          "Bu uygulama ile;\n\n✓Bilekliğinizdeki sağlık bilgilerinize ulaşabilir,\n✓Size özel sağlık bildirimlerini alabilir,\n✓Acil durum kişilerinize ulaşabilirsiniz..."),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tamam"),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Hesap",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Şifre Değiştir"),
            buildAccountOption(context, "Acil Durum Telefonu Ekle"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Bildirimler",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Düşme",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(width: 100),
                    CupertinoSwitch(
                        trackColor: Colors.grey,
                        activeColor: Colors.green,
                        value: isOn,
                        onChanged: (value) {
                          setState(() {
                            isOn = value;
                          });
                        })
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Bölge İhlali",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(width: 66),
                CupertinoSwitch(
                    trackColor: Colors.grey,
                    activeColor: Colors.green,
                    value: isOn1,
                    onChanged: (value) {
                      setState(() {
                        isOn1 = value;
                      });
                    })
              ],
            ),
            Row(
              children: [
                Text(
                  "Yüksek Sıcaklık",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(width: 27),
                CupertinoSwitch(
                    trackColor: Colors.grey,
                    activeColor: Colors.green,
                    value: isOn2,
                    onChanged: (value) {
                      setState(() {
                        isOn2 = value;
                      });
                    })
              ],
            ),
            Row(
              children: [
                Text(
                  "Yüksek Nabız",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(width: 44),
                CupertinoSwitch(
                    trackColor: Colors.grey,
                    activeColor: Colors.green,
                    value: isOn3,
                    onChanged: (value) {
                      setState(() {
                        isOn3 = value;
                      });
                    })
              ],
            ),
            GestureDetector(
              onTap: () {
                NotificationService()
                    .showNotification(1, "Uyarı", "Yüksek Sıcaklık", 10);
              },
              child: Container(
                height: 40,
                width: 200,
                color: Colors.green,
                child: Center(
                  child: Text("Show Notification"),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text("ÇIKIŞ YAP",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.green,
                        ),
                        hintText: "Eski Şifreniz",
                      ),
                    ),
                    TextField(
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.green,
                        ),
                        hintText: "Yeni Şifreniz",
                      ),
                    ),
                    TextField(
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.green,
                        ),
                        hintText: "Yeni Şifreniz Tekrar",
                      ),
                    ),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Kapat")),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Kaydet")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: TextField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.contact_phone,
                            color: Colors.green,
                          ),
                          hintText: "Acil Durum Telefon Numarası",
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Kapat")),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Kaydet")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
