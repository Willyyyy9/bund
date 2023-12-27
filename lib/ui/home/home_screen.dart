import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/home/widgets/ads/ad_slider.dart';
import 'package:bund/ui/home/widgets/bottom-bar/bottom_bar_widget.dart';
import 'package:bund/ui/home/widgets/conditions/home_conditions_widget.dart';
import 'package:bund/ui/home/widgets/header/home_header.dart';
import 'package:bund/ui/home/widgets/what-you-get/home_what_you_get_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(),
                  Gap(AppSize.s16),
                  AdSlider(),
                  HomeConditionsWidget(),
                  HomeWhatYouGetWidget()
                ],
              ),
            ),
          ),
          BottomBarWidget()
        ],
      ),
    ));
  }
}
