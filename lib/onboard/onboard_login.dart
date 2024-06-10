import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:umsonst_app_2/api/http_api.dart';
import 'package:umsonst_app_2/api/model/token_post.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';
import 'package:umsonst_app_2/components/onboard_input.dart';

import '../main.dart';

class LoginScreen extends StatelessWidget {
  final HttpService httpService =
  HttpService(baseApiUrl: "http://teilen.umsonstapp.de");

  LoginScreen({Key? key}) : super(key: key) {
    _initializeScreen();
  }

  String _userName = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  'Login',
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
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
                child: OnboardInput(
                  label: 'Username',
                  onChange: (text) {
                    _userName = text;
                  },
                  validator: (String? value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
                child: OnboardInput(
                  label: 'Passwort',
                  onChange: (text) {
                    _password = text;
                  },
                  validator: (String? value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: OnboardButton(
                  onPressed: () => _loginUser(context),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _initializeScreen() async {
    var storedBaseUrl = await HttpService.getCurrentServerUrl();
    if (storedBaseUrl != null) {
      httpService.baseApiUrl = storedBaseUrl;
    }
  }

  void saveApiToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "UMSONST_API_TOKEN", value: token);
  }

  void _loginUser(BuildContext context) async {
    TokenModel token = await httpService.createToken(_userName, _password);
    saveApiToken(token.token);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MyMainWidget()),
          (r) => false,
    );
  }
}