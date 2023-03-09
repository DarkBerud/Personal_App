import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gustavo_2_0/classes/ItemClass.dart';

import '../theme/colors_theme.dart';

class ListItemAddScreen extends StatefulWidget {
  final String id;

  ListItemAddScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ListItemAddScreen> createState() => _ListItemAddScreenState();
}

class _ListItemAddScreenState extends State<ListItemAddScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _costController = TextEditingController();

  final TextEditingController _quantifyController = TextEditingController();

  String _selected = "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/nophoto.png?alt=media&token=3ec8959f-0b6c-489e-93ff-5f2b0d37f4b3";

  List<Map> itensList = [
    //No Photo
    {
      "id": "0",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/nophoto.png?alt=media&token=3ec8959f-0b6c-489e-93ff-5f2b0d37f4b3"
    },
    //Canos
    {
      "id": "1",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FJoelho.jpg?alt=media&token=693f5e54-1927-4eae-a482-9d7d8bdbd646"
    },
    {
      "id": "2",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FT.jpg?alt=media&token=5a931f36-aa92-48ce-a3fe-64eebb3bdb6b"
    },
    {
      "id": "3",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FLuva.jpg?alt=media&token=8f06221a-6d71-4770-9a93-69e8fd901947"
    },
    {
      "id": "4",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FAdaptador.jpg?alt=media&token=14805ad8-2552-40be-bce7-6b86d3b4bb57"
    },
    {
      "id": "5",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FPlug.jpg?alt=media&token=f9a88ad4-a657-4c03-94a3-05370fdcfa9b"
    },
    {
      "id": "6",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FCotoveloAzul.jpg?alt=media&token=fccaeeec-5852-4196-937b-63042ab92c51"
    },
    {
      "id": "7",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FTAzul.jpg?alt=media&token=f65eea96-0fa9-4996-8cca-2a44f7b6ff61"
    },
    {
      "id": "8",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FCola.jpg?alt=media&token=8a56351b-2512-4e3c-b082-9e880af35ce9"
    },
    // mao de obra
    {
      "id": "9",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2Fpedreiro.png?alt=media&token=7fa62edd-3370-4d0d-a0a0-cc0e0d009c21"
    },
    {
      "id": "10",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2Fajudante%20de%20pedreiro.png?alt=media&token=0d3a3292-cc0e-49a7-b2ce-c457d77e7cbb"
    },
    // madeiramento
    {
      "id": "11",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FMadeira%202.png?alt=media&token=9e69a10f-e28a-4b8f-8f4a-add71bf661c5"
    },
    // documentacao
    {
      "id": "12",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/gustavo-2-0-2.appspot.com/o/images%2FPlanta.png?alt=media&token=6d0b1b68-9285-4669-8816-074ceeb677e0"
    },
  ];

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
                keyboardType: TextInputType.number,
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
                keyboardType: TextInputType.number,
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
            Center(
                child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: ThemeColors.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        hint: Text("Escolha um Item"),
                        value: _selected,
                        onChanged: (newValue) {
                          setState(() {
                            _selected = newValue.toString();
                          });
                        },
                        // items: FirebaseFirestore.instance.collection('images').doc(),
                        items: itensList.map((itenType) {
                          return DropdownMenuItem(
                            value: itenType["image"].toString(),
                            child: Center(
                              child: Image.network(
                                itenType["image"], width: 60,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            )
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
                image: _selected,
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
        .doc("${widget.id}")
        .collection("Item")
        .doc("${_nameController.text}");
    // final docTitle = FirebaseFirestore.instance.collection("test").doc();
    // final docTitle = FirebaseFirestore.instance.collection("test2").doc("test2").collection("test2").doc();
    title.id = docTitle.id;

    final json = title.toJson();
    await docTitle.set(json);
  }
}
