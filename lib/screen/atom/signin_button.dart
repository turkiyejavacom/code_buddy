import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Color primaryButtonColor;
  final VoidCallback onPressedAction;
  final String logoPath;
  final String buttonText;
  final Color? buttonTextColor;

  const SignInButton(
      {Key? key,
      required this.primaryButtonColor,
      required this.onPressedAction,
      required this.logoPath,
      required this.buttonText,
      this.buttonTextColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryButtonColor,
        ),
        onPressed: onPressedAction,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Image.asset(
                logoPath,
                height: 35.0,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: buttonTextColor, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
