import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:flutter/material.dart';

class IncomeTitleWidget extends StatelessWidget {
  const IncomeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.fixedIncomePortfolio,
          style:
              getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s22),
        ),
        Text(
          AppStrings.fixedIncomeSubtitle,
          style: getRegularStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
        ),
      ],
    );
  }
}
