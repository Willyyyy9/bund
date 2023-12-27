import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/income/widgets/details/income_detail_item.dart';
import 'package:bund/ui/income/widgets/details/income_term_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class IncomeDetailsWidget extends StatelessWidget {
  const IncomeDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.annualYieldIncome,
              style: getBoldStyle(
                  color: ColorManager.grey, fontSize: FontSize.s16),
            ),
            Icon(
              FontAwesomeIcons.circleInfo,
              color: ColorManager.grey,
              size: AppSize.s16,
            )
          ],
        ),
        Center(
          child: Text(
            "6.81%",
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s32),
          ),
        ),
        const Gap(AppSize.s10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IncomeDetailItem(title: AppStrings.averageRating, subtitle: "AA"),
            IncomeDetailItem(title: AppStrings.bonds, subtitle: "20 Companies"),
          ],
        ),
        const Gap(AppSize.s10),
        Text(
          AppStrings.termTypes,
          style: getSemiBoldStyle(
              color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Row(
          children: [
            IncomeTermItem(title: AppStrings.threeYearTerm),
            IncomeTermItem(title: AppStrings.fiveYearTerm)
          ],
        ),
      ],
    );
  }
}
