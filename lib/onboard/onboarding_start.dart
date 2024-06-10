import 'dart:async';

import 'package:flutter/material.dart';
import '../components/onboard_button.dart';
import '../devModeScreen.dart';

class OnboardStartWidget extends StatelessWidget {
  final VoidCallback carouselNextHandler;

  int _devModeTotalClicks = 0;
  StreamSubscription? _devModeAutoCancelSubscription;

  OnboardStartWidget({Key? key, required this.carouselNextHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onTabLogo(context);
                    }, // Image tapped
                    child: Image.asset(
                      'assets/images/umsonstapp_logo.png',
                      scale: 0.1,
                      width: 100,
                    ),
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
              padding: EdgeInsets.only(bottom: 26),
              child: Text(
                'Herzlich Willkommen',
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
            const Padding(
              padding: EdgeInsets.only(bottom: 26),
              child: Text(
                'umsonstApp - die App fürs Teilen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6A6A6A),
                ),
              ),
            ),
            const Text(
              'Finde Menschen in deiner Nähe, die brauchen, was du hast - oder dir geben, was du brauchst.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6A6A6A),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: OnboardButton(
                onPressed: carouselNextHandler,
                child: const Text(
                  'Weiter',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void onTabLogo(BuildContext context) {
    if (_devModeAutoCancelSubscription == null) {
      Future future = Future.delayed(const Duration(seconds: 10));
      _devModeAutoCancelSubscription = future.asStream().listen((data) {
        print("Reset Dev Settings");
        _devModeTotalClicks = 0;
      });
    }
    if (_devModeTotalClicks >= 8) {
      _devModeAutoCancelSubscription?.cancel();
      _devModeTotalClicks = 0;
      print("Open Dev Settings");
      navigateToDevTools(context);
    }
    _devModeTotalClicks++;
  }

  void navigateToDevTools(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DevModeScreenWidget())
    );
  }
}
