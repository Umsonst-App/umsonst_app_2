import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({required this.values});
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border:
            Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
      ),
      child: Center(
        child: DropdownButton(
          items: values
              .map((value) => DropdownMenuItem(
                    child: Center(child: Text(value)),
                    value: value,
                  ))
              .toList(),
          onChanged: (value) {
            print(value);
          },
          isExpanded: false,
          value: values.first,
          icon: const Icon(
            Icons.expand_more,
            color: Color(0xFFFF918A),
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
