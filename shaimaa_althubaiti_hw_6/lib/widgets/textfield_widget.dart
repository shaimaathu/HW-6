import 'package:flutter/material.dart';
import 'package:shaimaa_althubaiti_hw_6/helper/extintion.dart';

class Textfield extends StatelessWidget {
  const Textfield(
      {super.key,
      required this.hintText,
      this.textController});
  final String hintText;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: context.getWidth()/2,
      height: 50,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 143, 86, 152)
      ),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: InputBorder.none
        ),
        validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          
      ),
    );
  }
}
