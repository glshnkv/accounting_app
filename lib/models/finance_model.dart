import 'package:hive_flutter/hive_flutter.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 0)
class FinanceModel {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final OperationType type;
  @HiveField(3)
  final String icon;

  FinanceModel(
      {required this.amount,
        required this.name,
        required this.type,
        required this.icon});
}

@HiveType(typeId: 1)
enum OperationType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}