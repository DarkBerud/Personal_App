import 'package:flutter/material.dart';
import 'package:gustavo_2_0/Models/listCard.dart';
import 'package:gustavo_2_0/screens/listAddScreen.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

class ListManagementScreen extends StatefulWidget {
  const ListManagementScreen({Key? key}) : super(key: key);

  @override
  State<ListManagementScreen> createState() => _ListManagementScreenState();
}

class _ListManagementScreenState extends State<ListManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listas"),
        backgroundColor: ThemeColors.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(32.0),
        children: const [
          ListCard(title: "Exemplo"),
          ListCard(title: "Exemplo"),
          ListCard(title: "Exemplo"),
          ListCard(title: "Exemplo"),
          ListCard(title: "Exemplo"),
          ListCard(title: "Exemplo"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListAddScreen()));
        },
        backgroundColor: ThemeColors.containerColor,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
