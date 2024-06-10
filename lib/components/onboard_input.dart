import 'package:flutter/material.dart';

class OnboardInput extends StatelessWidget {
  const OnboardInput({required this.label, this.validator, this.onChange, this.initialValue, this.controller});
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        hintText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFFBEBAB3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFFBEBAB3)),
        ),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onChanged: onChange,
      initialValue: initialValue,
      controller: controller,
    );
  }
}
