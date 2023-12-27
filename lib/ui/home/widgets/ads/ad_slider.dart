import 'package:bund/cubit/home_cubit.dart';
import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/color_manager.dart';
import 'package:bund/resource/value_manager.dart';
import 'package:bund/ui/home/widgets/ads/ad_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdSlider extends StatefulWidget {
  const AdSlider({super.key});

  @override
  State<AdSlider> createState() => _AdSliderState();
}

class _AdSliderState extends State<AdSlider> {
  List<Widget> ads = [
    const AdItem(
        leadingIcon: IconAssets.bundStandardIcon,
        trailingIcon: IconAssets.cimBanqueIcon),
    const AdItem(
        leadingIcon: IconAssets.bundPlusIcon,
        trailingIcon: IconAssets.cimBanqueIcon),
    const AdItem(
        leadingIcon: IconAssets.bundMaxIcon, trailingIcon: IconAssets.ubsIcon),
    const AdItem(
        leadingIcon: IconAssets.bundUnlimitedIcon,
        trailingIcon: IconAssets.ubsIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
            options: CarouselOptions(
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  BlocProvider.of<HomeCubit>(context).changeIndex(index);
                },
                padEnds: false),
            items: ads),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SizedBox(
              height: AppSize.s25,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ads.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: AppSize.s8,
                    height: AppSize.s8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.selectedIndex == index
                            ? ColorManager.primary
                            : ColorManager.lightGrey),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
