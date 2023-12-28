import 'package:auto_size_text/auto_size_text.dart';
import 'package:bund/data/models/bond.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class IncomeBondItem extends StatelessWidget {
  const IncomeBondItem({super.key, required this.bond});
  final Bond bond;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m4),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s16)),
      child: Row(children: [
        Builder(builder: (context) {
          return SizedBox(
            width: AppSize.s40,
            child: SvgPicture.asset(
              bond.icon,
              height: AppSize.s40,
              width: AppSize.s40,
              fit: BoxFit.scaleDown,
            ),
          );
        }),
        const Gap(AppSize.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                bond.title,
                maxLines: 1,
                style: getSemiBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s16),
              ),
              AutoSizeText(
                bond.subtitle,
                maxLines: 1,
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s12),
              ),
            ],
          ),
        ),
        AutoSizeText(
          bond.apy,
          maxLines: 1,
          style: getSemiBoldStyle(
              color: ColorManager.success, fontSize: FontSize.s14),
        ),
      ]),
    );
  }
}
