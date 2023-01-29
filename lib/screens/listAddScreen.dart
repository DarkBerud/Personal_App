import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

import '../classes/titlesClass.dart';

class ListAddScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final typechossen = ValueNotifier("");
  final type = ["Agenda", "Contas", "Financeiro", "Investimento","Material",];

  ListAddScreen({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Nova lista adicionada"),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar uma nova lista"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColors.primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColors.containerColor)),
                label: Text(
                  "Nome",
                  style: TextStyle(color: ThemeColors.primaryColor),
                ),
              ),
              controller: _nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: ValueListenableBuilder(
                  valueListenable: typechossen,
                  builder: (BuildContext context, String value, _) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text(
                        "Escolha um tipo",
                        style: TextStyle(color: ThemeColors.primaryColor),
                      ),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (chose) =>
                          typechossen.value = chose.toString(),
                      items: type
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(
                                op,
                                style: const TextStyle(
                                    color: ThemeColors.primaryColor),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Nova lista adicionada"),
                  duration: Duration(seconds: 3),
                ),
              );
              final list = TitlesClass(
                title: _nameController.text,
                type: typechossen.value.toString(),
              );
              creatList(list);
              Navigator.pop(context);
            },
            child: const Text("Criar")),
      ),
    );
  }

  Future creatList(TitlesClass title) async {
    final docTitle = FirebaseFirestore.instance
        .collection("lists")
        .doc("${_nameController.text}");
    // final docTitle = FirebaseFirestore.instance.collection("test").doc();
    // final docTitle = FirebaseFirestore.instance.collection("test2").doc("test2").collection("test2").doc();
    title.id = docTitle.id;

    final json = title.toJson();
    await docTitle.set(json);
  }
}

