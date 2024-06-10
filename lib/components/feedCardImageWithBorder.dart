import 'package:flutter/material.dart';

class FeedCardImageWidthBorder extends StatelessWidget {
  final String image;
  FeedCardImageWidthBorder({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        child: Stack(children: <Widget>[
          InkResponse(
            child: Image.network(image, fit: BoxFit.cover, width: 1500),
            onTap: () => {
              print("Tab image")
            },
          )
        ]),
      ),
    );
  }
}
