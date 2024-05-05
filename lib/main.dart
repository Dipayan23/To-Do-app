import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox('myBox');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}
