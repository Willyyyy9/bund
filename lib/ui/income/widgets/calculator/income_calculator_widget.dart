import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bund/cubit/income/income_cubit.dart';
import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/income/widgets/calculator/income_selected_term_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class IncomeCalculatorWidget extends StatefulWidget {
  const IncomeCalculatorWidget({super.key});

  @override
  State<IncomeCalculatorWidget> createState() => _IncomeCalculatorWidgetState();
}

class _IncomeCalculatorWidgetState extends State<IncomeCalculatorWidget> {
  Timer? _timer;
  final GlobalKey<TooltipState> incrementTooltipKey = GlobalKey<TooltipState>();
  final GlobalKey<TooltipState> decrementTooltipKey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCubit, IncomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.investmentCalculator,
              style: getSemiBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s16),
            ),
            Container(
              padding: const EdgeInsets.all(AppPadding.p16),
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s10)),
              child: Column(
                children: [
                  Text(
                    AppStrings.investmentAmount,
                    style: getSemiBoldStyle(
                        color: ColorManager.grey, fontSize: FontSize.s12),
                  ),
                  const Gap(AppSize.s5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onLongPressStart: (details) {
                            _timer = Timer.periodic(
                                const Duration(milliseconds: 100), (timer) {
                              context.read<IncomeCubit>().decrementInvestment();
                            });
                          },
                          onLongPressEnd: (details) {
                            _timer!.cancel();
                            _timer = null;
                            setState(() {});
                          },
                          onTap: () {
                            decrementTooltipKey.currentState
                                ?.ensureTooltipVisible();

                            context.read<IncomeCubit>().decrementInvestment();
                          },
                          child: Tooltip(
                              message: AppStrings.holdToDecrementContinuously,
                              triggerMode: TooltipTriggerMode.manual,
                              key: decrementTooltipKey,
                              child: SvgPicture.asset(
                                  IconAssets.decrementButtonIcon))),
                      AutoSizeText(
                        "\$${state.investmentAmount.ceil()}",
                        style: getSemiBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s32),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _timer = Timer.periodic(
                              const Duration(milliseconds: 100), (timer) {
                            context.read<IncomeCubit>().incrementInvestment();
                          });
                        },
                        onLongPressEnd: (details) {
                          _timer!.cancel();
                          _timer = null;
                          setState(() {});
                        },
                        onTap: () {
                          incrementTooltipKey.currentState
                              ?.ensureTooltipVisible();
                          context.read<IncomeCubit>().incrementInvestment();
                        },
                        child: Tooltip(
                          message: AppStrings.holdToIncrementContinuously,
                          triggerMode: TooltipTriggerMode.manual,
                          key: incrementTooltipKey,
                          child:
                              SvgPicture.asset(IconAssets.incrementButtonIcon),
                        ),
                      ),
                    ],
                  ),
                  const Gap(AppSize.s5),
                  Container(
                    padding: const EdgeInsets.all(AppPadding.p4),
                    decoration: BoxDecoration(
                        color: ColorManager.success.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(AppSize.s5)),
                    child: Text(
                      "${state.annualYield}% YTM",
                      style: getSemiBoldStyle(
                          color: ColorManager.success, fontSize: FontSize.s14),
                    ),
                  ),
                  const Gap(AppSize.s5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IncomeSelectedTermItem(title: AppStrings.threeYearTerm),
                      IncomeSelectedTermItem(title: AppStrings.fiveYearTerm),
                    ],
                  ),
                  const Gap(AppSize.s5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.capitalAtMaturity,
                            style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s12),
                          ),
                          Text(
                            "\$${state.capitalAtMaturity.ceil()}",
                            style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s22),
                          ),
                          const Gap(AppSize.s5),
                          Text(
                            AppStrings.annualInterest,
                            style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s12),
                          ),
                          Text(
                            "\$${state.annualInterest.ceil()}",
                            style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s22),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.totalInterest,
                            style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s12),
                          ),
                          Text(
                            "\$${state.totalInterest.ceil()}",
                            style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s22),
                          ),
                          const Gap(AppSize.s5),
                          Text(
                            AppStrings.averageMaturityDate,
                            style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s12),
                          ),
                          Text(
                            "${state.averageMaturityDate.ceil()}",
                            style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s22),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
