import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/models/listCard.dart';
import 'package:gustavo_2_0/screens/listItemScreen.dart';
import 'package:gustavo_2_0/screens/listManagementScreen.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

import '../classes/titlesClass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Principal"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: ThemeColors.primaryColor,
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.exit_to_app,
                    textDirection: TextDirection.ltr,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListManagementScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Gerenciar Listas",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Deslogar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 90,
                  width: 140,
                  child: Container(
                    color: ThemeColors.containerColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Entradas",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "R\$ 20.000,00",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  width: 140,
                  child: Container(
                    color: ThemeColors.containerColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Saidas",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "R\$ 20.000,00",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              height: 70,
              color: ThemeColors.containerColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Saldo",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "R\$ 100.000,00",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          StreamBuilder<List<TitlesClass>>(
            stream: readTitles(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Deu ruim!!");
              } else if (snapshot.hasData) {
                final titles = snapshot.data!;
                return ListView(
                  shrinkWrap: true,
                  children: titles.map(buildTitle).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          // ListCard(title: "Depósito Material de Construção"), //tipo material
          // ListCard(title: "Contrução Casa Mombaça"), //tipo material
          // ListCard(title: "Despesas"), // tipo financeiro
          // ListCard(title: "Entradas"), // tipo financeiro
          // ListCard(title: "Investimentos"), // tipo investimento
          // ListCard(title: "Agenda"), //Tipo agenda
        ],
      ),
    );
  }

  Widget buildTitle(TitlesClass titles) => InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListItemScreen(id: "${titles.id}", title: "${titles.title}", type: "${titles.type}",)));
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        height: 40,
        color: ThemeColors.containerColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "${titles.title}",
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
  );

  Stream<List<TitlesClass>> readTitles() => FirebaseFirestore.instance
      .collection("lists")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => TitlesClass.fromJson(doc.data())).toList());
}
