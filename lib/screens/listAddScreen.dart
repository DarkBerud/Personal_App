import 'package:flutter/material.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

class ListAddScreen extends StatelessWidget {
 final TextEditingController _nameController = TextEditingController();
 final TextEditingController _typeController = TextEditingController();

  ListAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar uma nova lista"),
        backgroundColor: ThemeColors.primaryColor,
      ),
      body: ListView(
        children: [
          TextField(
            controller: _nameController,
          )
        ],
      ),
    );
  }
}
