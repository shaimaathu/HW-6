import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.title, required this.onPress,});
      
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(title,style: TextStyle(
        fontSize: 20
      ),),
    );
  }
}
