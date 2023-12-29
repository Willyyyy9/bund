part of 'income_cubit.dart';

class IncomeState {
  String selectedTerm;
  double investmentAmount;
  double capitalAtMaturity;
  double annualInterest;
  double totalInterest;
  double annualYield = 6.81;
  int averageMaturityDate;

  final hive = GetIt.instance<Box>();
  List<Bond> bonds = [
    Bond(
        icon: IconAssets.netflixIcon,
        title: AppStrings.netflixInc,
        subtitle: "BBB",
        apy: "5.37% APY"),
    Bond(
        icon: IconAssets.fordIcon,
        title: AppStrings.fordMotorLLC,
        subtitle: "BB+",
        apy: "7.71% APY"),
    Bond(
        icon: IconAssets.appleIcon,
        title: AppStrings.appleInc,
        subtitle: "AA+",
        apy: "4.85% APY"),
    Bond(
        icon: IconAssets.morganIcon,
        title: AppStrings.morganStanley,
        subtitle: "A-",
        apy: "6.27% APY"),
  ];

  IncomeState({
    required this.selectedTerm,
    required this.investmentAmount,
    required this.capitalAtMaturity,
    required this.annualInterest,
    required this.totalInterest,
    required this.averageMaturityDate,
  });
}
