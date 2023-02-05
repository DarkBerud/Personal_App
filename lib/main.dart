import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gustavo_2_0/models/materialCard.dart';
import 'package:gustavo_2_0/screens/homeScreen.dart';
import 'package:gustavo_2_0/screens/listAddScreen.dart';
import 'package:gustavo_2_0/screens/listItemScreen.dart';
import 'package:gustavo_2_0/screens/listManagementScreen.dart';
import 'package:gustavo_2_0/theme/default_theme.dart';
import 'firebase_options.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "Gustavo 2.0.2",
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
       // home: ListItemScreen(id: "teste", title: "teste", type: "Material", image: "assets/images/T.jpg",),
    );
  }
}



