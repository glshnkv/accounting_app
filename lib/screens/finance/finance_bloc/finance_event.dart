part of 'finance_bloc.dart';

@immutable
sealed class FinanceEvent {}

class GetFinanceInfoEvent extends FinanceEvent {}

class AddOperationEvent extends FinanceEvent {
  final FinanceModel operation;

  AddOperationEvent({required this.operation});
}

class DeleteOperationEvent extends FinanceEvent {
  final FinanceModel operation;

  DeleteOperationEvent({required this.operation});
}

class EditOperationEvent extends FinanceEvent {
  final FinanceModel operation;
  final FinanceModel editOperation;

  EditOperationEvent({required this.operation, required this.editOperation});
}
