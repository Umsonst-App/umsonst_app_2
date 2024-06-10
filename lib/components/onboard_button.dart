import 'package:flutter/material.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({required this.onPressed, required this.child});
  final GestureTapCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(200, 32)
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(bottom: 22, top: 22, left: 40, right: 40),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFFFFD38A)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                )
            )
        ),
      onPressed: onPressed,
      child: child,
    );
  }
}
