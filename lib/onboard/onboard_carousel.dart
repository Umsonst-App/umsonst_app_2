import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:umsonst_app_2/main.dart';
import 'package:umsonst_app_2/onboard/onboarding_location.dart';
import 'package:umsonst_app_2/onboard/onboarding_start.dart';
import 'package:umsonst_app_2/onboard/onboarding_step1.dart';

import 'onboard_register.dart';
import 'onboarding_step2.dart';
import 'onboarding_step3.dart';
import 'onboarding_step4.dart';

class OnboardCarousel extends StatefulWidget {
  const OnboardCarousel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OnboardCarouselState();
  }
}

class OnboardCarouselState extends State<OnboardCarousel> {
  int current = 0;
  late List<Widget> carouselPages;
  CarouselController controller = CarouselController();

  void checkIfLoggedIn(BuildContext context) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "UMSONST_API_TOKEN");
    if (token != null && token != "") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MyMainWidget()),
            (r) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    carouselPages = [
      OnboardStartWidget(carouselNextHandler: navigateOnNextCarouselPage),
      OnboardingStep1(carouselNextHandler: navigateOnNextCarouselPage),
      OnboardingStep2(carouselNextHandler: navigateOnNextCarouselPage),
      OnboardingStep4(carouselNextHandler: navigateOnNextCarouselPage),
      OnboardingStep3(carouselNextHandler: navigateOnNextCarouselPage),
      OnboardRegisterScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    checkIfLoggedIn(context);
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            viewportFraction: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            height: MediaQuery.of(context).size.height,
            onPageChanged: (index, reason) {
              // Dismiss keyboard if open
              FocusScope.of(context).unfocus();
              setState(() {
                current = index;
              });
            },
          ),
          items: carouselPages,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselPages.asMap().entries.map((entry) {
            return Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == entry.key
                    ? const Color(0xFFE3AA79)
                    : const Color(0xFFC4C4C4),
              ),
            );
          }).toList(),
        ),
      )
    ]));
  }

  void navigateOnNextCarouselPage() {
    controller.nextPage();
  }

  void navigateToDashboardPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyMainWidget()),
    );
  }
}
