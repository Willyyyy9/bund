import 'package:bund/cubit/home_cubit.dart';
import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/home/widgets/conditions/home_condition_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeConditionsWidget extends StatelessWidget {
  const HomeConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.conditions,
                style: getSemiBoldStyle(
                    color: ColorManager.lightPrimary, fontSize: FontSize.s16),
              ),
              Row(
                children: [
                  Expanded(
                      child: HomeConditionItem(
                          icon: IconAssets.depositIcon,
                          title: state.deposits[state.selectedIndex])),
                  Expanded(
                      child: HomeConditionItem(
                          icon: IconAssets.subscriptionIcon,
                          title: state.subscriptions[state.selectedIndex])),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
