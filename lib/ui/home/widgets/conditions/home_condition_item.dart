import 'package:auto_size_text/auto_size_text.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeConditionItem extends StatelessWidget {
  const HomeConditionItem({super.key, required this.title, required this.icon});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      padding: const EdgeInsets.all(AppPadding.p4),
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(color: ColorManager.white.withOpacity(0.8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const Gap(AppSize.s10),
          AutoSizeText(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: getSemiBoldStyle(
                color: ColorManager.lightPrimary, fontSize: FontSize.s12),
          )
        ],
      ),
    );
  }
}
