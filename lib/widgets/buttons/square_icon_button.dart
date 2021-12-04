import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  const SquareIconButton(this.iconPath, {required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.all(0),
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.white,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 24,
        ),
      ),
    );
  }
}
