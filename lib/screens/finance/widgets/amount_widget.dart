import 'package:accounting_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AmountWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String content;

  const AmountWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColors.white10,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: SvgPicture.asset(icon),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.white60),
              ),
              Text(
                content,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
