import 'package:flutter/material.dart';
import 'package:umsonst_app_2/components/menu_button.dart';
import 'package:umsonst_app_2/components/onboard_input.dart';
import 'package:umsonst_app_2/profile/profileDetail.dart';

import '../feed.dart';
import '../menu.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

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
              Image.asset(
                'assets/images/umsonstapp_logo.png',
                scale: 0.1,
                width: 160,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 100, left: 100),
                child: MenuButton(
                  child: const Text(
                    'Edit',
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
                            builder: (context) =>
                                const ProfileDetailScreenWidget()))
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text("My feed..."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
