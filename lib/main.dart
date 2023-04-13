import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo/Ui/home_screen.dart';
import 'package:todo/Ui/splash_screen.dart';
import 'package:todo/backend/data.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('Database');
  runApp(Todo());
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoData(),
      builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
