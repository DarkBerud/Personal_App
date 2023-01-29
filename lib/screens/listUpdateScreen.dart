import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';
import '../classes/titlesClass.dart';

class ListUpdateScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  final typechossen = ValueNotifier("");
  final typeChose = ["Agenda", "Contas", "Financeiro", "Investimento","Material",];
  final String id;
  final String title;
  final String type;



  ListUpdateScreen({Key? key, required this.id, required this.title, required this.type}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    nameController.text = "${title}";
    typechossen.value = "${type}";
    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            TextFormField(
              decoration:  InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ThemeColors.primaryColor)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ThemeColors.containerColor)),
                label: Text("Nome", style: TextStyle(color: ThemeColors.primaryColor),),
              ),
              controller: nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left:8.0),
              child: ValueListenableBuilder(valueListenable: typechossen, builder: (BuildContext context, String value, _) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Escolha um tipo", style: TextStyle(color: ThemeColors.primaryColor),),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (chose) => typechossen.value = chose.toString(),
                  items: typeChose.map((op) => DropdownMenuItem(
                    value:op,
                    child: Text(op, style: const TextStyle(color: ThemeColors.primaryColor),),),).toList(),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(onPressed: (){
          final docTitle = FirebaseFirestore.instance.collection("lists").doc("${id}");
          docTitle.update({
            'title' : nameController.text,
            'type': typechossen.value.toString(),
          });
          Navigator.pop(context);
        }, child: const Text("Atualizar")),
      ),
    );
  }
  Future creatList(TitlesClass title) async {
    final docTitle = FirebaseFirestore.instance.collection("lists").doc();
    // final docTitle = FirebaseFirestore.instance.collection("test").doc();
    // final docTitle = FirebaseFirestore.instance.collection("test2").doc("test2").collection("test2").doc();
    title.id = docTitle.id;

    final json = title.toJson();
    await docTitle.set(json);

  }
}


