import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/classes/ItemClass.dart';

import '../theme/colors_theme.dart';

class ListItemAddScreen extends StatelessWidget {
  final String id;

  ListItemAddScreen({Key? key, required this.id}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _imageController = TextEditingController();

  final TextEditingController _costController = TextEditingController();

  final TextEditingController _quantifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar um novo Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeColors.containerColor)),
                  label: Text(
                    "Nome",
                    style: TextStyle(color: ThemeColors.primaryColor),
                  ),
                ),
                controller: _nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeColors.containerColor)),
                  label: Text(
                    "Valor",
                    style: TextStyle(color: ThemeColors.primaryColor),
                  ),
                ),
                controller: _costController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeColors.containerColor)),
                  label: Text(
                    "Quantidade",
                    style: TextStyle(color: ThemeColors.primaryColor),
                  ),
                ),
                controller: _quantifyController,
              ),
            ),
            DropdownMenuItem(
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FJoelho.jpg?alt=media&token=693f5e54-1927-4eae-a482-9d7d8bdbd646"
              ),
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: ThemeColors.primaryColor)),
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: ThemeColors.containerColor)),
            //     label: Text(
            //       "Imagem",
            //       style: TextStyle(color: ThemeColors.primaryColor),
            //     ),
            //   ),
            //   controller: _imageController,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Novo Item adicionado"),
                  duration: Duration(seconds: 3),
                ),
              );
              final list = ItemClass(
                name: _nameController.text,
                cost: num.tryParse(_costController.text) ?? 0,
                quantify: num.tryParse(_quantifyController.text) ?? 0,
                image: _imageController.text,
              );
              creatList(list);
              Navigator.pop(context);
            },
            child: const Text("Criar")),
      ),
    );
  }

  Future creatList(ItemClass title) async {
    final docTitle = FirebaseFirestore.instance
        .collection("lists")
        .doc("$id")
        .collection("Item")
        .doc("${_nameController.text}");
    // final docTitle = FirebaseFirestore.instance.collection("test").doc();
    // final docTitle = FirebaseFirestore.instance.collection("test2").doc("test2").collection("test2").doc();
    title.id = docTitle.id;

    final json = title.toJson();
    await docTitle.set(json);
  }
}
