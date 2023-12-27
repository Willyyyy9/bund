// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState {
  int selectedIndex;
  List<String> deposits = [
    AppStrings.noMinimumDeposit,
    AppStrings.tenKDeposit,
    AppStrings.fiftyKDeposit,
    AppStrings.fiveHundredKDeposit,
  ];
  List<String> subscriptions = [
    AppStrings.fifteenSubscription,
    AppStrings.thirtySubscription,
    AppStrings.twoHundredSubscription,
    AppStrings.noMonthlySubscription,
  ];

  List<List<Perk>> perks = [
    [
      Perk(icon: IconAssets.depositIcon, title: AppStrings.swissBankAccount),
      Perk(
          icon: IconAssets.mastercardIcon, title: AppStrings.mastercardPrepaid),
      Perk(icon: IconAssets.thunderIcon, title: AppStrings.accountOpenSameDay),
      Perk(
          icon: IconAssets.umbrellaIcon,
          title: AppStrings.protectedUpToHundred),
    ],
    [
      Perk(icon: IconAssets.depositIcon, title: AppStrings.swissBankAccount),
      Perk(
          icon: IconAssets.mastercardIcon,
          title: AppStrings.mastercardCreditDebit),
      Perk(
          icon: IconAssets.umbrellaIcon,
          title: AppStrings.protectedUpToHundred),
      Perk(
          icon: IconAssets.investmentPortfolioIcon,
          title: AppStrings.investmentPortfolio),
      Perk(
          icon: IconAssets.fixedDepositIcon,
          title: AppStrings.fixedIncomeDeposit),
    ],
    [
      Perk(icon: IconAssets.depositIcon, title: AppStrings.swissBankAccount),
      Perk(
          icon: IconAssets.mastercardIcon,
          title: AppStrings.mastercardCreditDebit),
      Perk(
          icon: IconAssets.umbrellaIcon,
          title: AppStrings.protectedUpToHundred),
      Perk(
          icon: IconAssets.investmentPortfolioIcon,
          title: AppStrings.investmentPortfolio),
      Perk(
          icon: IconAssets.fixedDepositIcon,
          title: AppStrings.fixedIncomeDeposit),
    ],
    [
      Perk(icon: IconAssets.depositIcon, title: AppStrings.swissBankAccount),
      Perk(
          icon: IconAssets.mastercardIcon,
          title: AppStrings.mastercardCreditDebit),
      Perk(
          icon: IconAssets.umbrellaIcon,
          title: AppStrings.protectedUpToHundred),
      Perk(
          icon: IconAssets.investmentPortfolioIcon,
          title: AppStrings.investmentPortfolio),
      Perk(
          icon: IconAssets.fixedDepositIcon,
          title: AppStrings.fixedIncomeDeposit),
    ],
  ];
  HomeState({
    required this.selectedIndex,
  });
}
