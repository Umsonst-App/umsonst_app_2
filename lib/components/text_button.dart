import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  const TextButton({required this.onPressed, required this.child});

  final GestureTapCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              Size(
                  MediaQuery.of(context).size.width,
                  50
              )
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.only(bottom: 24, top: 24, left: 32, right: 32),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0x00000000),
          ),
          elevation: MaterialStateProperty.all<double>(
              0
          ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
