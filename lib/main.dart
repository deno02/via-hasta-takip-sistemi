import 'package:flutter/material.dart';

import 'girisluttie.dart';
import 'notificationService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: girisluttie(),
    );
  }
}
