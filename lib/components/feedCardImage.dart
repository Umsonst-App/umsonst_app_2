import 'dart:io';

import 'package:flutter/material.dart';

class FeedCardImage extends StatelessWidget {
  final String image;
  final bool localImage;
  FeedCardImage({required this.image, this.localImage = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0.0)),
        child: Stack(children: <Widget>[
          InkResponse(
            child: localImage ? Image.file(File(image), fit: BoxFit.cover, width: 1500) : Image.network(image, fit: BoxFit.cover, width: 1500),
            onTap: () => {
              print("Tab image")
            },
          )
        ]),
      ),
    );
  }
}
