import 'package:accounting_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Widget child;
  const MessageWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius:BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(10))),
      child: child,
    );
  }
}