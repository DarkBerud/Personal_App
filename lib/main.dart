import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gustavo_2_0/screens/homeScreen.dart';
import 'package:gustavo_2_0/theme/default_theme.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VirtualAssistence());
}

class VirtualAssistence extends StatelessWidget {
  const VirtualAssistence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme,
      home: HomeScreen(),
    );
  }
}



