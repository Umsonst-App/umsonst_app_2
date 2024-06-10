import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:umsonst_app_2/chat.dart';
import 'package:umsonst_app_2/main.dart';
import 'package:umsonst_app_2/onboard/onboard_carousel.dart';
import 'package:umsonst_app_2/profile/profile.dart';
import 'package:umsonst_app_2/settings/settings.dart';

import 'add.dart';
import 'components/menu_button.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/umsonstapp_logo.png',
                            scale: 0.1,
                            width: 120,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'umsonstApp',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Kalam',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFF918A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
                      child: MenuButton(
                        child: const Text(
                          'Entdecken',
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
                                  builder: (context) => const MyMainWidget()))
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
                      child: MenuButton(
                        child: const Text(
                          'Biete/Suche',
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
                    /*Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MenuButton(
                        child: const Text(
                          'Suche',
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
                                  builder: (context) => const MyMainWidget()))
                        },
                      ),
                    ), */
                    // Padding(
                    //  padding: const EdgeInsets.only(bottom: 16),
                    //  child: MenuButton(
                    //    child: const Text(
                    //      'Teilkreise',
                    //      textAlign: TextAlign.center,
                    //      style: TextStyle(
                    //        fontSize: 24,
                    //        fontWeight: FontWeight.w500,
                    //        color: Color(0xFF3C3A36),
                    //      ),
                    //    ),
                    //    onPressed: () => {},
                    //  ),
                    //),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
                      child: MenuButton(
                        child: const Text(
                          'Chat',
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
                                  builder: (context) => const MyChatWidget()))
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 50, right: 50),
                      child: MenuButton(
                        child: const Text(
                          'Profil',
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
                          'Einstellungen',
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
                                  builder: (context) => SettingsPageWidget()))
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 34, left: 50, right: 50),
                      child: TextButton(
                        child: const Text(
                          'Ausloggen',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF78746D),
                          ),
                        ),
                        onPressed: () => {
                          logout(context)
                        },
                      ),
                    ),
                  ],
                ))));
  }

  logout(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "UMSONST_API_TOKEN", value: '');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnboardCarousel()),
          (r) => false,
    );
  }
}
