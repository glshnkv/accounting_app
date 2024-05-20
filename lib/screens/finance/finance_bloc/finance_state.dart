part of 'finance_bloc.dart';

@immutable
sealed class FinanceState {}

final class FinanceInitial extends FinanceState {}

final class LoadedFinanceInfoState extends FinanceState {
  final int balance;
  final int income;
  final int expenses;

  final List<FinanceModel> allOperations;
  final List<FinanceModel> incomeOperations;
  final List<FinanceModel> expensesOperations;

  LoadedFinanceInfoState({
      required this.balance,
      required this.income,
      required this.expenses,
      required this.allOperations,
      required this.incomeOperations,
      required this.expensesOperations});
}

final class EmptyFinanceInfoState extends FinanceState {}

