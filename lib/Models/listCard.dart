import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';

class ListCard extends StatelessWidget {
  final String title;

  const ListCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
