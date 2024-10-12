import 'package:flutter/material.dart';
import 'package:news_alone/presentation/widgets/home_page.dart';

import 'core/getit.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:HomePage(),);
  }
}
