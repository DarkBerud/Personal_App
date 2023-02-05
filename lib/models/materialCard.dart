import 'package:flutter/material.dart';
import '../theme/colors_theme.dart';

class MaterialCard extends StatelessWidget {
  final String title;
  final double cost;
  final int quantify;

  const MaterialCard({Key? key, required this.title, required this.cost, required this.quantify}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              height: 40,
              color: ThemeColors.containerColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
