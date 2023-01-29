import 'package:flutter/material.dart';

class ListItemScreen extends StatefulWidget {
  final String id;
  final String title;
  final String type;

  const ListItemScreen({Key? key, required this.id, required this.title, required this.type}) : super(key: key);

  @override
  State<ListItemScreen> createState() => _ListItemScreenState();
}

class _ListItemScreenState extends State<ListItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
      ),
      body: ListView(),
    );
  }
}
