import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/classes/ItemClass.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gustavo_2_0/screens/itemAddScreeen.dart';
import 'package:gustavo_2_0/screens/itemUpdateScreen.dart';

import '../theme/colors_theme.dart';

class ListItemScreen extends StatefulWidget {
  final String id;

  ListItemScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ListItemScreen> createState() => _ListItemScreenState();
}

class _ListItemScreenState extends State<ListItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.id}"),
      ),
      body: StreamBuilder<List<ItemClass>>(
        stream: readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("${snapshot.error}");
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
              MaterialPageRoute(builder: (context) => ListItemAddScreen(id: widget.id,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTitle(ItemClass titles) => Padding(
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
                                content: Text("Item deletado"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            final docList = FirebaseFirestore.instance
                                .collection("lists")
                                .doc("${widget.id}")
                                .collection("Item")
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
                    builder: (context) => ItemUpdateScreen(id: widget.id, itemId: titles.id, name: titles.name, cost: titles.cost, quantify: titles.quantify, image: titles.image, )));
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ThemeColors.containerColor,
                ),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        width: 65,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              // child: assetOrNetwork()
                              //     ? Image.asset("assets/images/T.jpg", fit: BoxFit.scaleDown,
                              //         errorBuilder: (BuildContext context,
                              //             Object exception,
                              //             StackTrace? stackTrace) {
                              //         return Image.asset(
                              //             "assets/images/nophoto.png");
                              //       }) :
                              Image.network("${titles.image}",
                                  fit: BoxFit.scaleDown, errorBuilder:
                                      (BuildContext context, Object exception,
                                          StackTrace? stackTrace) {
                            return Image.asset("assets/images/nophoto.png");
                          }),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${titles.name}",
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "R\$ ${titles.cost}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "Quantidade ${titles.quantify}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Stream<List<ItemClass>> readItems() => FirebaseFirestore.instance
      .collection("lists")
      .doc("${widget.id}")
      .collection("Item")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ItemClass.fromJson(doc.data())).toList());
}
