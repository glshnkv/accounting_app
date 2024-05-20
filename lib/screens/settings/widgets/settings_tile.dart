import 'package:accounting_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final void Function() onTap;

  const SettingsTile(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.white),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white60,
            )
          ],
        ),
      ),
    );
  }
}
