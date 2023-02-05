import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/screens/listAddScreen.dart';
import 'package:gustavo_2_0/screens/listUpdateScreen.dart';
import '../classes/titlesClass.dart';
import '../theme/colors_theme.dart';

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
      body: StreamBuilder<List<TitlesClass>>(
        stream: readTitles(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Deu ruim!!");
          } else if (snapshot.hasData) {
            final titles = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(32.0),
              children: titles.map(buildTitle).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
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

  // Widget buildTitle(Titles titles) => ListTile(
  //   leading: CircleAvatar(child: Text("${titles.title}"),),
  //   title: Text("${titles.title}"),
  //   subtitle: Text("${titles.title}"),
  // );

  Widget buildTitle(TitlesClass titles) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: InkWell(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("${titles.id}"),
                    content: Text("Tem certeza que quer deletar a lista?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Não")),
                      TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Lista deletada"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            final docList = FirebaseFirestore.instance
                                .collection("lists")
                                .doc("${titles.id}");
                            docList.delete();
                            Navigator.pop(context);
                          },
                          child: Text("Sim")),
                    ],
                  );
                });
          },
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListUpdateScreen(
                          id: "${titles.id}",
                          title: "${titles.title}",
                          type: "${titles.type}",
                        )));
          },
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: ThemeColors.containerColor,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "${titles.title}",
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ]),
        ),
      );

  Stream<List<TitlesClass>> readTitles() => FirebaseFirestore.instance
      .collection("lists")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TitlesClass.fromJson(doc.data()))
          .toList());
}
