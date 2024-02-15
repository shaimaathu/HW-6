import 'package:flutter/material.dart';
import 'package:shaimaa_althubaiti_hw_6/screens/homa_screen.dart';
import 'package:shaimaa_althubaiti_hw_6/utils/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
