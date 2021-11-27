import 'package:flutter/material.dart';
import 'package:sepedaan/utils/cons.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SignInButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith(
          (states) => 5,
        ),
        shadowColor: MaterialStateProperty.resolveWith(
          (states) => Colors.black26,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Colors.white,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ic-google.png',
              width: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Sign In With Google',
              style: TextStyle(
                fontSize: 12,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
