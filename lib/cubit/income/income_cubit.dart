import 'package:bloc/bloc.dart';
import 'package:bund/data/models/bond.dart';
import 'package:bund/resource/asset_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

part 'income_state.dart';

class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit()
      : super(IncomeState(
            selectedTerm: AppStrings.threeYearTerm,
            investmentAmount: 10000,
            capitalAtMaturity: 0,
            annualInterest: 0,
            totalInterest: 0,
            averageMaturityDate: 0)) {
    _calculateInitialValues();
  }

  void _calculateInitialValues() {
    state.investmentAmount =
        state.hive.get(AppStrings.investmentAmount) ?? 10000;
    state.capitalAtMaturity = getCapitalAtMaturity();
    state.annualInterest = getAnnualInterest();
    state.totalInterest = getTotalInterest();
    state.averageMaturityDate = getAverageMaturityDate();

    emit(state); // Emitting the updated state after initial calculations
  }

  incrementInvestment() {
    EasyLoading.show(status: AppStrings.loading);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => EasyLoading.dismiss());
    if (state.investmentAmount >= 10000) {
      state.investmentAmount = state.investmentAmount + 10000;
    } else if (state.investmentAmount < 10000 &&
        !(state.investmentAmount < 1000)) {
      state.investmentAmount = state.investmentAmount + 1000;
    } else if (state.investmentAmount < 1000 &&
        !(state.investmentAmount < 250)) {
      state.investmentAmount = state.investmentAmount + 50;
    }
    state.hive.put(AppStrings.investmentAmount, state.investmentAmount);

    double capitalAtMaturity = getCapitalAtMaturity();
    double annualInterest = getAnnualInterest();
    double totalInterest = getTotalInterest();
    int averageMaturityDate = getAverageMaturityDate();

    emit(IncomeState(
      selectedTerm: state.selectedTerm,
      investmentAmount: state.investmentAmount,
      capitalAtMaturity: capitalAtMaturity,
      annualInterest: annualInterest,
      totalInterest: totalInterest,
      averageMaturityDate: averageMaturityDate,
    ));
  }

  decrementInvestment() {
    EasyLoading.show(status: AppStrings.loading);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => EasyLoading.dismiss());
    if (state.investmentAmount > 10000) {
      state.investmentAmount = state.investmentAmount - 10000;
    } else if (state.investmentAmount <= 10000 &&
        !(state.investmentAmount <= 1000)) {
      state.investmentAmount = state.investmentAmount - 1000;
    } else if (state.investmentAmount <= 1000 &&
        !(state.investmentAmount <= 250)) {
      state.investmentAmount = state.investmentAmount - 50;
    }
    state.hive.put(AppStrings.investmentAmount, state.investmentAmount);

    double capitalAtMaturity = getCapitalAtMaturity();
    double annualInterest = getAnnualInterest();
    double totalInterest = getTotalInterest();
    int averageMaturityDate = getAverageMaturityDate();

    emit(IncomeState(
      selectedTerm: state.selectedTerm,
      investmentAmount: state.investmentAmount,
      capitalAtMaturity: capitalAtMaturity,
      annualInterest: annualInterest,
      totalInterest: totalInterest,
      averageMaturityDate: averageMaturityDate,
    ));
  }

  void changeSelectedTerm(String term) {
    state.selectedTerm = term;

    double capitalAtMaturity = getCapitalAtMaturity();
    double annualInterest = getAnnualInterest();
    double totalInterest = getTotalInterest();
    int averageMaturityDate = getAverageMaturityDate();

    emit(IncomeState(
      selectedTerm: term,
      investmentAmount: state.investmentAmount,
      capitalAtMaturity: capitalAtMaturity,
      annualInterest: annualInterest,
      totalInterest: totalInterest,
      averageMaturityDate: averageMaturityDate,
    ));
  }

  double getCapitalAtMaturity() {
    int selectedTerm = (state.selectedTerm == AppStrings.threeYearTerm) ? 3 : 5;

    return (((state.annualYield / 100) *
            selectedTerm *
            state.investmentAmount) +
        state.investmentAmount);
  }

  double getAnnualInterest() {
    return state.investmentAmount * (state.annualYield / 100);
  }

  double getTotalInterest() {
    int selectedTerm = (state.selectedTerm == AppStrings.threeYearTerm) ? 3 : 5;
    return state.investmentAmount * (state.annualYield / 100) * selectedTerm;
  }

  int getAverageMaturityDate() {
    int selectedTerm = (state.selectedTerm == AppStrings.threeYearTerm) ? 3 : 5;
    state.averageMaturityDate = DateTime.now().year + selectedTerm;
    return DateTime.now().year + selectedTerm;
  }
}
