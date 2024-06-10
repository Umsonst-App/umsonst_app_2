import 'package:flutter/material.dart';
import 'package:umsonst_app_2/profile/profile.dart';
import 'package:umsonst_app_2/settings/about.dart';

import '../add.dart';
import '../components/menu_button.dart';
import '../menu.dart';

class SettingsPageWidget extends StatelessWidget {
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
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 32),
            child: Column(
        children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                'Einstellungen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Kalam',
                  height: 1,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF918A),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
              child: MenuButton(
                child: const Text(
                  'Konto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3C3A36),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreenWidget()))
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
              child: MenuButton(
                child: const Text(
                  'Feedback',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3C3A36),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAddWidget()))
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
              child: MenuButton(
                child: const Text(
                  'Über',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3C3A36),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutScreenWidget()))
                },
              ),
            ),
        ],
      ),
          )),
    );
  }
}
