import 'dart:io';

import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/feedCardWidget.dart';

import 'api/http_api.dart';
import 'components/dropdown.dart';
import 'components/onboard_button.dart';
import 'components/tabbar_button.dart';

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final HttpService httpService =
      HttpService(baseApiUrl: "http://teilen.umsonstapp.de");
  List<FeedCardWidget> _postsWidgets = [];

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  void getAllPosts() async {
    var storedBaseUrl = await HttpService.getCurrentServerUrl();
    if (storedBaseUrl != null) {
      httpService.baseApiUrl = storedBaseUrl;
    }
    var posts = await httpService.getPosts();
    List<FeedCardWidget> postsWidgets = [];
    for (var post in posts) {
      List<String> images = post.images;
      List<String> imageUrls = [];
      for (var element in images) {
        imageUrls.add("${httpService.baseApiUrl}$element");
      }
      postsWidgets.add(FeedCardWidget(
          title: post.title, description: post.description, images: imageUrls,
      ));
    }
    _postsWidgets = postsWidgets;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: TabbarButtonWidget("Angebote", "Gesuche"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Dropdown(
                values: ["+ 5km", "+ 10km", "+ 25km", "+ 50km", "+ 100km"]),
            Dropdown(values: ["Category 1", "Category 2", "Category 3"]),
          ],
        ),
        Column(
          children: _postsWidgets,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Center(
              child: OnboardButton(
                  onPressed: () => getAllPosts(),
                  child: const Text("Refresh"))),
        ),
      ],
      reverse: false,
    );
  }
}
