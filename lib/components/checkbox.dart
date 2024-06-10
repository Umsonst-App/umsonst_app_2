import 'package:flutter/material.dart';

class UmsonstCheckbox extends StatelessWidget {
  bool value = false;
  final bool disabled;
  final double size;
  final ValueChanged<bool> onChanged;

  UmsonstCheckbox({
    this.size = 32,
    this.value = false,
    this.disabled = false,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backColor = disabled ? Colors.red : Colors.white;
    final checkColor = disabled ? Colors.grey : const Color(0xFFFFBC97);
    final borderColor = disabled ? Colors.grey : const Color(0xFFFFBC97);

    return Theme(
      data: Theme.of(context).copyWith(
        disabledColor: Colors.orange,
        unselectedWidgetColor: const Color(0xFFFFBC97),
      ),
      child: GestureDetector(
        onTap: () {
          print("Container clicked");
          value = !value;
        },
        child: SizedBox(
          width: size,
          height: size,
          child: Container(
            decoration: BoxDecoration(
              color: backColor,
              border: Border.all(
                color: borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: Transform.scale(
              scale: size / Checkbox.width,
              child: Checkbox(
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                activeColor: Colors.transparent,
                checkColor: checkColor,
                value: value,
                onChanged: disabled
                    ? null
                    : (value) {
                        onChanged(value ?? false);
                      },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
