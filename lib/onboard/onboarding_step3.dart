import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umsonst_app_2/components/onboard_button.dart';

class OnboardingStep3 extends StatelessWidget {
  final VoidCallback carouselNextHandler;

  const OnboardingStep3({Key? key, required this.carouselNextHandler})
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
              child: Container(
                  height: 200,
                  width: 275,
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/images/onboarding/step3.svg',
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'Entdecken & Unterstützen',
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
            const Text(
              'Finde interessante Ressourcen.\n Und schau´ nach Möglichkeiten, anderen Menschen weiterzuhelfen.',
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
                  'Los geht´s',
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
}
