import 'package:flutter/material.dart';
import 'package:habit/import.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HabitProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Habit',
        home: HabitScreen(),
      ),
    );
  }
}
