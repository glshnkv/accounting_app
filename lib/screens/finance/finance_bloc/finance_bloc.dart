import 'package:accounting_app/models/finance_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'finance_event.dart';

part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitial()) {
    on<GetFinanceInfoEvent>(_getFinanceInfoHandler);
    on<AddOperationEvent>(_addOperationHandler);
    on<DeleteOperationEvent>(_deleteOperationHandler);
    on<EditOperationEvent>(_editOperationHandler);
  }

  void _getFinanceInfoHandler(
      GetFinanceInfoEvent event, Emitter<FinanceState> emit) async {
    List<FinanceModel> finances = [];

    int balance = 0;
    int income = 0;
    int expenses = 0;

    List<FinanceModel> incomeOperations = [];
    List<FinanceModel> expensesOperations = [];

    final financeBox = Hive.box('finances');

    if (financeBox.isNotEmpty) {
      for (int i = 0; i < financeBox.length; i++) {
        finances.add(financeBox.getAt(i));
      }

      finances = finances.reversed.toList();

      for (FinanceModel operation in finances) {
        if (operation.type == OperationType.income) {
          incomeOperations.add(operation);
          income += operation.amount;
        } else {
          expensesOperations.add(operation);
          expenses += operation.amount;
        }
      }

      balance = income - expenses;

      emit(LoadedFinanceInfoState(
          balance: balance,
          income: income,
          expenses: expenses,
          allOperations: finances,
          incomeOperations: incomeOperations,
          expensesOperations: expensesOperations));
    } else {
      emit(EmptyFinanceInfoState());
    }
  }

  void _addOperationHandler(
      AddOperationEvent event, Emitter<FinanceState> emit) async {
    final financeBox = Hive.box('finances');
    financeBox.add(event.operation);
  }

  void _deleteOperationHandler(
      DeleteOperationEvent event, Emitter<FinanceState> emit) async {

    List<FinanceModel> finances = [];

    final financeBox = Hive.box('finances');

    if (financeBox.isNotEmpty) {
      for (int i = 0; i < financeBox.length; i++) {
        finances.add(financeBox.getAt(i));
      }

      final int _foundIndex = finances.indexOf(event.operation);
      financeBox.deleteAt(_foundIndex);
    }
  }

  void _editOperationHandler(
      EditOperationEvent event, Emitter<FinanceState> emit) async {

    List<FinanceModel> finances = [];

    final financeBox = Hive.box('finances');

    if (financeBox.isNotEmpty) {
      for (int i = 0; i < financeBox.length; i++) {
        finances.add(financeBox.getAt(i));
      }

      final int _foundIndex = finances.indexOf(event.operation);
      financeBox.putAt(_foundIndex, event.editOperation);
    }
  }
}
