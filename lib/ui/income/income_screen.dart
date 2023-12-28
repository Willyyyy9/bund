import 'package:bund/cubit/income/income_cubit.dart';
import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/income/widgets/bonds/income_bonds_widget.dart';
import 'package:bund/ui/income/widgets/calculator/income_calculator_widget.dart';
import 'package:bund/ui/income/widgets/details/income_details_widget.dart';
import 'package:bund/ui/income/widgets/title/income_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: SvgPicture.asset(
                  IconAssets.backIcon,
                  height: AppSize.s32,
                ),
              )),
          title: Text(
            AppStrings.fixedIncome,
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s20),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IncomeTitleWidget(),
                Gap(AppSize.s10),
                IncomeDetailsWidget(),
                Gap(AppSize.s10),
                IncomeCalculatorWidget(),
                Gap(AppSize.s10),
                IncomeBondsWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
