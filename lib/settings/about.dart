import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/onboard/onboard_carousel.dart';

import '../add.dart';
import '../components/menu_button.dart';
import '../menu.dart';

class AboutScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFFF918A)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainMenuWidget()));
              },
            )
          ]),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  'Über',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Kalam',
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF918A),
                  ),
                ),
              ),
              Card(
                child: ExpansionTile(
                  collapsedIconColor: const Color(0xFFFF918A),
                  iconColor: const Color(0xFFFF918A),
                  title: const Text(
                    "Vision",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Kalam',
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF918A),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 25),
                      child: Column(
                        children: const [
                          Center(
                            child: Text(
                                "die umsonstApp wirkt in deinem Umfeld und unterstützt unsere Mitwelt. Denn du findest bei dir andere Menschen, die brauchen, was du über hast - oder dir geben, was du brauchst."),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  collapsedIconColor: const Color(0xFFFF918A),
                  iconColor: const Color(0xFFFF918A),
                  title: const Text(
                    "Lizenzen",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Kalam',
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF918A),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 25),
                      child: Column(
                        children: const [
                          Text("- flutter"),
                          Text("- cupertino_icons"),
                          Text("- flutter_svg"),
                          Text("- camera"),
                          Text("- path_provider"),
                          Text("- path"),
                          Text("- flutter_chat_ui"),
                          Text("- http"),
                          Text("- carousel_slider"),
                          Text("- image_picker"),
                          Text("- floating_bottom_navigation_bar"),
                          Text("- geolocator"),
                          Text("- shared_preferences"),
                          Text("- flutter_secure_storage"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  collapsedIconColor: const Color(0xFFFF918A),
                  iconColor: const Color(0xFFFF918A),
                  title: const Text(
                    "Datenschutz",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Kalam',
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF918A),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 25),
                      child: Column(
                        children: const [
                          Center(
                            child: Text("https://www.umsonstapp.de/impressum"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: OnboardButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardCarousel()));
                  },
                  child: const Text(
                    'App Kennenlernen',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
