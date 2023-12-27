import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/routes/app_pages.dart';
import 'package:bund/ui/home/widgets/bottom-bar/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: ColorManager.white),
      padding: const EdgeInsets.all(AppMargin.m16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomBarItem(
            icon: IconAssets.homeIcon,
            title: AppStrings.home,
            onTap: () {},
          ),
          BottomBarItem(
            icon: IconAssets.investmentIcon,
            title: AppStrings.investment,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.INCOME);
            },
          ),
          BottomBarItem(
            icon: IconAssets.chatIcon,
            title: AppStrings.chat,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
