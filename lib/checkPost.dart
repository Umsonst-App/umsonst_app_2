import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/main.dart';
import 'api/http_api.dart';
import 'components/feedCardWidget.dart';

class CheckPostWidget extends StatelessWidget {
  final HttpService httpService =
  HttpService(baseApiUrl: "http://02064-54968.pph-server.de/");
  List<String> images = [];
  final String title;
  final String description;

  CheckPostWidget({required this.title, required this.description, required this.images, Key? key}) : super(key: key) {
    _initializeScreen();
  }

  void _initializeScreen() async {
    var storedBaseUrl = await HttpService.getCurrentServerUrl();
    if (storedBaseUrl != null) {
      httpService.baseApiUrl = storedBaseUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    'Überprüfe deinen Post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Kalam',
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF918A),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: FeedCardWidget(
                    title: title,
                    description: description,
                    images: images,
                    localImage: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: OnboardButton(
                    onPressed: () => _createPost(context),
                    child: const Text(
                      'Teilen',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }

  _createPost(BuildContext context) {
    httpService.createPost(title, description);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyMainWidget()));
  }
}
