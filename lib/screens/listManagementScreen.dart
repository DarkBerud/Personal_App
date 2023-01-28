import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/models/listCard.dart';
import 'package:gustavo_2_0/screens/listAddScreen.dart';

class ListManagementScreen extends StatefulWidget {
  ListManagementScreen({Key? key}) : super(key: key);

  @override
  State<ListManagementScreen> createState() => _ListManagementScreenState();
}

class _ListManagementScreenState extends State<ListManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listas"),
      ),
      body: StreamBuilder<List<Titles>>(
        stream: readTitles(),
         builder: (context, snapshot){
          if (snapshot.hasError){
            return Text("Deu ruim!!");
          } else
          if (snapshot.hasData){
            final titles = snapshot.data!;
            return  ListView(
              padding: const EdgeInsets.all(32.0),
              children: titles.map(buildTitle).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
         },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListAddScreen()));
        },
        // backgroundColor: ThemeColors.containerColor,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
  
  Widget buildTitle (Titles title) => ListCard(title: Text(title.title),);
  

  Stream<List<Titles>> readTitles() => FirebaseFirestore.instance
      .collection("lists")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Titles.fromJson(doc.data())).toList());
}

class Titles {
  String id;
  final String title;

  Titles({
    this.id = "",
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };

  static Titles fromJson(Map<String, dynamic> json) => Titles(
        id: json["id"],
        title: json["title"],
      );
}
