import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/components/onboard_input.dart';

import '../menu.dart';

class ProfileDetailScreenWidget extends StatelessWidget {
  const ProfileDetailScreenWidget({Key? key}) : super(key: key);

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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Kontoeinstellungen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Kalam',
                  height: 1,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF918A),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: OnboardInput(label: "Profilname"),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: OnboardInput(label: "Passwort ändern"),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: OnboardInput(label: "Email"),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: OnboardInput(label: "Standort"),
              ),
              OnboardButton(
                onPressed: () {},
                child: const Text(
                  'Standort festlegen',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
