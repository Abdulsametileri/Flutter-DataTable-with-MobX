import 'package:flutter/material.dart';

class ExButton extends StatelessWidget {
  String buttonText;
  VoidCallback onPressed;

  ExButton({Key key, @required this.buttonText, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: FlatButton(
        color: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
