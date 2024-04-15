import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.text = "", required this.callback, super.key});
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: callback,
      child: Text(text),
    );
  }
}
