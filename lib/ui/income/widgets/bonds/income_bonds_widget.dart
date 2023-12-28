import 'package:bund/cubit/income/income_cubit.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/font_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/style_manager.dart';
import 'package:bund/ui/income/widgets/bonds/income_bond_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeBondsWidget extends StatelessWidget {
  const IncomeBondsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCubit, IncomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.bonds,
              style: getSemiBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s16),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.bonds.length,
              itemBuilder: (context, index) {
                return IncomeBondItem(bond: state.bonds[index]);
              },
            )
          ],
        );
      },
    );
  }
}
