import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hasta/lottie.dart';
import 'package:hasta/patient.dart';
import 'package:http/http.dart' as http;

import 'viaweb.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  late final Patient patient;
  var data;
  bool _isObscure = true;
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
            color: Colors.green,
            gradient: LinearGradient(
              colors: [Colors.green, Colors.green],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, top: 0),
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Text(
                      "Hasta Takip Sistemi",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "                                                                  v3.0",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            controller: username,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              icon: Icon(
                Icons.account_circle,
                color: Colors.green,
              ),
              hintText: "Kullanıcı Adı",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            controller: pass,
            obscureText: _isObscure,
            enableSuggestions: false,
            autocorrect: false,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              focusColor: Colors.green,
              suffixIcon: IconButton(
                  color: Colors.green,
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }),
              icon: Icon(
                Icons.vpn_key,
                color: Colors.green,
              ),
              hintText: "Şifre",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.green],
            ),
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: FlatButton(
            minWidth: double.infinity,
            onPressed: () async {
              final response = await http
                  .post(Uri.parse("http://mysql.via.tc:8080/login.php"), body: {
                'username': username.text,
                'sifre': pass.text,
              });
              data = json.decode(response.body);
              if (data[0]['UserRole'] == '3') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => luttie(id: data[0]['UserID']),
                    ));
              }
              if (data[0]['UserRole'] == '2') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => luttie(id: data[0]['UserID']),
                    ));
              }
              if (data[0]['UserRole'] == '1') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => luttie(id: data[0]['UserID']),
                    ));
              }
            },
            child: Text("Giriş Yap",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
        SizedBox(height: 45),
        FlatButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => via(),
              ),
            );
          },
          child: Image.asset(
            'images/viaTeknoloji.png',
            width: displayWidth(context) * 0.65,
          ),
        ),
      ],
    )));
  }
}
