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

class OnboardPasswordInput extends StatefulWidget {
  const OnboardPasswordInput({required this.label, this.validator, this.onChange, this.initialValue, this.controller});
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final FormFieldValidator<String>? validator;

  @override
  _OnboardPasswordInputState createState() => _OnboardPasswordInputState();
}

class _OnboardPasswordInputState extends State<OnboardPasswordInput> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        hintText: widget.label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFFBEBAB3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFFBEBAB3)),
        ),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChange,
      initialValue: widget.initialValue,
      controller: widget.controller,
      obscureText: _obscureText,
    );
  }
}
