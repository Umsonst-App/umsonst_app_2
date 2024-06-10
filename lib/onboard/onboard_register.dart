import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:umsonst_app_2/api/http_api.dart';
import 'package:umsonst_app_2/api/model/register_post.dart';
import 'package:umsonst_app_2/api/model/token_post.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/components/onboard_input.dart';
import 'package:umsonst_app_2/onboard/onboard_login.dart';

import '../main.dart';
import 'onboarding_location.dart';

class OnboardRegisterScreen extends StatelessWidget {
  final HttpService httpService =
  HttpService(baseApiUrl: "http://teilen.umsonstapp.de");

  OnboardRegisterScreen({Key? key}) : super(key: key) {
    _initializeScreen();
  }

  String _userName = "";
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/umsonstapp_logo.png',
                    scale: 0.1,
                    width: 100,
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
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Account erstellen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontFamily: 'Kalam',
                  height: 1,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF918A),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
            //   child: OnboardInput(
            //     label: 'Username',
            //     onChange: (value) {_userName = value;},
            //     validator: (String? value) {},
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                  top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: OnboardInput(
                label: 'E-Mail',
                onChange: (value) {_email = value;},
                validator: (String? value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: OnboardInput(
                label: 'Passwort',
                onChange: (value) {_password = value;},
                validator: (String? value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: OnboardButton(
                onPressed: () => {
                    _registerUser(context, _email, _password)
                },
                child: const Text(
                  'Registrieren',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Einloggen',
                    style: TextStyle(color: Color(0xFF78746D)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _initializeScreen() async {
    var storedBaseUrl = await HttpService.getCurrentServerUrl();
    if (storedBaseUrl != null) {
      var httpService;
      httpService.baseApiUrl = storedBaseUrl;
    }
  }

  void saveApiToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "UMSONST_API_TOKEN", value: token);
  }

  void navigateToDashboardPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyMainWidget()),
    );
  }

  void _registerUser(BuildContext context, String email, String password) async {
    var storedBaseUrl = await HttpService.getCurrentServerUrl();
    if (storedBaseUrl != null) {
      httpService.baseApiUrl = storedBaseUrl;
    }
    RegisterModel registeredUser = await httpService.registerUser( email, password);
    TokenModel token = await httpService.createToken(_userName, _password);
    saveApiToken(token.token);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingLocation()),
          (r) => false,
    );
    //saveApiToken(token.token);
    /*Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MyMainWidget()),
          (r) => false,
    );
     */
  }
}
