import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_2_0/classes/ItemClass.dart';

import '../theme/colors_theme.dart';

class ListItemScreen extends StatefulWidget {
  final String id;
  final String title;
  final String type;
  final String image;

  ListItemScreen(
      {Key? key, required this.id, required this.title, required this.type, required this.image})
      : super(key: key);

  @override
  State<ListItemScreen> createState() => _ListItemScreenState();
}

class _ListItemScreenState extends State<ListItemScreen> {
  @override

  bool assetOrNetwork() {
    if (widget.image.contains("http")) {
      return false;
    }
    return true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: InkWell(
              onTap: () {},
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
                              child: assetOrNetwork()
                                  ? Image.asset(widget.image, fit: BoxFit.scaleDown,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                      return Image.asset(
                                          "assets/images/nophoto.png");
                                    })
                                  : Image.network(widget.image, fit: BoxFit.scaleDown,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                      return Image.asset(
                                          "assets/images/nophoto.png");
                                    }),
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "T",
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
                                        "R\$ 100,00",
                                        style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "999",
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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: InkWell(
              onTap: () {},
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
                              child: assetOrNetwork()
                                  ? Image.asset("assets/images/joelho.jpg", fit: BoxFit.scaleDown,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                      return Image.asset(
                                          "assets/images/nophoto.png");
                                    })
                                  : Image.network(widget.image, fit: BoxFit.scaleDown,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                      return Image.asset(
                                          "assets/images/nophoto.png");
                                    }),
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Joelho",
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
                                        "R\$ 100,00",
                                        style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "999",
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTitle(ItemClass titles) => Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: InkWell(
      onTap: () {},
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
                      color: Colors.black26,
                    ),
                    width: 65,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: assetOrNetwork()
                          ? Image.asset(widget.image, fit: BoxFit.cover,
                          errorBuilder: (BuildContext context,
                              Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset(
                                "assets/images/nophoto.png");
                          })
                          : Image.network(widget.image, fit: BoxFit.cover,
                          errorBuilder: (BuildContext context,
                              Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset(
                                "assets/images/nophoto.png");
                          }),
                    ),
                  ),
                  VerticalDivider(),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 190,
                              child: Text(
                                "R\$ 100,00",
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                "999",
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );

  Stream<List<ItemClass>> readTitles() => FirebaseFirestore.instance
      .collection("lists")
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => ItemClass.fromJson(doc.data()))
      .toList());
}
