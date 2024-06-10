import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({required this.onPressed, required this.child});

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
            const EdgeInsets.only(bottom: 18, top: 18, left: 32, right: 32),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFFD38A),
          ),
          elevation: MaterialStateProperty.all<double>(
            0
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: const BorderSide(color: Color(0xFFBEBAB3))
              )
          )
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
