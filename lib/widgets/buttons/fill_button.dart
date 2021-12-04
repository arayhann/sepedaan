import 'package:flutter/material.dart';
import 'package:sepedaan/utils/cons.dart';

class FillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final BorderRadiusGeometry borderRadius;

  const FillButton({
    required this.width,
    required this.height,
    required this.onPressed,
    required this.child,
    this.color = primaryColor,
    this.borderRadius = BorderRadius.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.all(0),
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => color,
          ),
        ),
        child: child,
      ),
    );
  }
}
