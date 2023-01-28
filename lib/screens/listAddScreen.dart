import 'package:flutter/material.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

class ListAddScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final typechossen = ValueNotifier("");
  final type = ["exemplo1" , "exemplo2"];

  ListAddScreen({Key? key}) : super(key: key);

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
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ThemeColors.primaryColor)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ThemeColors.containerColor)),
                label: Text("Nome", style: TextStyle(color: ThemeColors.primaryColor),),
              ),
              controller: _nameController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left:8.0),
              child: ValueListenableBuilder(valueListenable: typechossen, builder: (BuildContext context, String value, _) {
                return DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Escolha um tipo", style: TextStyle(color: ThemeColors.primaryColor),),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (chose) => typechossen.value = chose.toString(),
                  items: type.map((op) => DropdownMenuItem(
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
          Navigator.pop(context);
        }, child: const Text("Criar")),
      ),
    );
  }
}
