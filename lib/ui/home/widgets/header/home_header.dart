import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        children: [
          SvgPicture.asset(IconAssets.profileIcon),
          const Gap(AppSize.s10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.goodMorning,
                style: getRegularStyle(
                    color: ColorManager.primary, fontSize: FontSize.s10),
              ),
              Text(
                AppStrings.mehemetTaser,
                style: getSemiBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s14),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(IconAssets.notificationIcon),
        ],
      ),
    );
  }
}
