import 'package:flutter/material.dart';

class TextFromField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  const TextFromField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        hintStyle: const TextStyle(
          //color: Colors.grey,
          fontFamily: "Inter",
          fontSize: 18,
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15.0),
      ),
    );
  }
}
