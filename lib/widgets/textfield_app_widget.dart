
import 'package:accounting_app/theme/colors.dart';
import 'package:flutter/material.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const TextFieldAppWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.white),
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: AppColors.white30, fontWeight: FontWeight.w500),
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.darkGrey,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}