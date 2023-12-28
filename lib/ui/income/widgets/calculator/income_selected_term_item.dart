import 'package:bund/cubit/income/income_cubit.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeSelectedTermItem extends StatelessWidget {
  const IncomeSelectedTermItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCubit, IncomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<IncomeCubit>(context).changeSelectedTerm(title);
          },
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m6),
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p8),
            decoration: BoxDecoration(
                color: state.selectedTerm == title
                    ? ColorManager.selectedTermColor
                    : ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s5),
                border: Border.all(
                    width:
                        state.selectedTerm == title ? AppSize.s0_8 : AppSize.s0,
                    color: state.selectedTerm == title
                        ? ColorManager.primary
                        : ColorManager.backgroundGreyGrey)),
            child: Text(
              title,
              style: getSemiBoldStyle(
                  color: state.selectedTerm == title
                      ? ColorManager.primary
                      : ColorManager.grey,
                  fontSize: FontSize.s14),
            ),
          ),
        );
      },
    );
  }
}
