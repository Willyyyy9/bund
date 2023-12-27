import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:flutter/material.dart';

class IncomeDetailItem extends StatelessWidget {
  const IncomeDetailItem(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getSemiBoldStyle(
              color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        Text(
          subtitle,
          style: getSemiBoldStyle(
              color: ColorManager.primary, fontSize: FontSize.s22),
        ),
      ],
    );
  }
}
