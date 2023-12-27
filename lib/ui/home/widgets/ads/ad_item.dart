import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AdItem extends StatelessWidget {
  const AdItem(
      {super.key, required this.leadingIcon, required this.trailingIcon});
  final String leadingIcon;
  final String trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.2,
      padding: const EdgeInsets.all(AppPadding.p16),
      margin: const EdgeInsets.all(AppMargin.m16),
      decoration: BoxDecoration(color: ColorManager.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(leadingIcon),
                const Gap(AppSize.s10),
                SvgPicture.asset(IconAssets.startNowButtonIcon),
              ],
            ),
          ),
          Expanded(child: SvgPicture.asset(trailingIcon)),
        ],
      ),
    );
  }
}
