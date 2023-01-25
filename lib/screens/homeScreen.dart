import 'package:flutter/material.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

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
        backgroundColor: ThemeColors.primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: ThemeColors.primaryColor,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
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
                      onTap: () {},
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
                  width: 150,
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
                  width: 150,
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
                      "100.000,00",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Depósito Material de Construção",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Contrução Casa Mombaça",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Despesas",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Entradas",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Investimentos",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Agenda",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
