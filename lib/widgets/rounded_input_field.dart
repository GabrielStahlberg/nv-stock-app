import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';
import 'package:nv_stock_app/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enabled;
  final TextEditingController controller;
  final double widthSize;
  final VoidCallback? onTap;
  final Function(String)? onChanged;

  const RoundedInputField(
      {Key? key,
        this.hintText = "",
        this.readOnly = false,
        this.enabled = true,
        this.inputType = TextInputType.text,
        this.suffixIcon,
        required this.icon,
        required this.controller,
        required this.widthSize,
        required this.onTap,
        required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      widthSize: widthSize,
      child: TextField(
        enabled: enabled,
        controller: controller,
        readOnly: readOnly,
        keyboardType: inputType,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        onTap: onTap,
        onChanged: onChanged,
      ),
    );
  }
}