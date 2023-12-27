import 'package:bund/cubit/home_cubit.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/home/widgets/conditions/home_condition_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWhatYouGetWidget extends StatelessWidget {
  const HomeWhatYouGetWidget({super.key});

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
                AppStrings.whatYouGet,
                style: getSemiBoldStyle(
                    color: ColorManager.lightPrimary, fontSize: FontSize.s16),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ...state.perks[state.selectedIndex]
                      .map((perk) =>
                          HomeConditionItem(title: perk.title, icon: perk.icon))
                      .toList()
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
