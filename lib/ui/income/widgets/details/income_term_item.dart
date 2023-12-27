import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:flutter/material.dart';

class IncomeTermItem extends StatelessWidget {
  const IncomeTermItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m6),
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p8),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s5),
          border: Border.all(width: AppSize.s0_8, color: ColorManager.grey)),
      child: Text(
        title,
        style:
            getSemiBoldStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      ),
    );
  }
}
