import 'package:flutter/material.dart';

class textFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPass;
  const textFieldInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPass=false
    });

  @override
  Widget build(BuildContext context) {
    final inputBorder= OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled:  true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
      ),
      obscureText: isPass,
      keyboardType: textInputType,
    );
  }
}