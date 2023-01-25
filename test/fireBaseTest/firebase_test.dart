import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class fireBaseTest extends StatelessWidget {
  const fireBaseTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: InputDecoration(
              hintText: ("Name"),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: controllerAge,
            decoration: InputDecoration(
              hintText: ("Age"),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                final user = User(
                  name: controllerName.text,
                  age: int.parse(controllerAge.text),
                );
                creatUser(user);
              },
              child: Text("Create")),
        ],
      ),
    );
  }



  Future creatUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection("users").doc();
    // final docUser = FirebaseFirestore.instance.collection("test").doc();
    // final docUser = FirebaseFirestore.instance.collection("test2").doc("test2").collection("test2").doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);

    //   final user = User(
    //       id: docUser.id,
    //       name: name,
    //       age: 21,
    //   );
    //   final json = user.toJson();
    //
    //   await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int age;

  User({
    this.id = "",
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };
}
