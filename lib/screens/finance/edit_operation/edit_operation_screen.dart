import 'package:accounting_app/models/finance_model.dart';
import 'package:accounting_app/router/router.dart';
import 'package:accounting_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:accounting_app/widgets/action_button_widget.dart';
import 'package:accounting_app/widgets/app_container.dart';
import 'package:accounting_app/widgets/textfield_app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class EditOperationScreen extends StatefulWidget {
  final FinanceModel operation;

  const EditOperationScreen({super.key, required this.operation});

  @override
  State<EditOperationScreen> createState() => _EditOperationScreenState();
}

class _EditOperationScreenState extends State<EditOperationScreen> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  String operationType = 'Income';

  String selectedIcon = 'assets/images/finance/car.svg';

  final List<String> icons = [
    'assets/images/finance/car.svg',
    'assets/images/finance/card.svg',
    'assets/images/finance/cash.svg',
    'assets/images/finance/food.svg',
    'assets/images/finance/game.svg',
    'assets/images/finance/med.svg',
    'assets/images/finance/rental.svg',
    'assets/images/finance/self.svg',
    'assets/images/finance/shopping.svg',
    'assets/images/finance/stock.svg',
    'assets/images/finance/study.svg',
    'assets/images/finance/wallet.svg',
  ];

  @override
  void initState() {
    nameController.text = widget.operation.name;
    amountController.text = widget.operation.amount.toString();
    operationType =
    widget.operation.type == OperationType.income ? 'Income' : 'Expense';
    selectedIcon = widget.operation.icon;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text(
          'Change operation',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                TextFieldAppWidget(
                    controller: nameController, hintText: 'Operation name'),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) =>
                          CupertinoActionSheet(
                            actions: <CupertinoActionSheetAction>[
                              CupertinoActionSheetAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  operationType = 'Income';
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: const Text('Income'),
                              ),
                              CupertinoActionSheetAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  operationType = 'Expense';
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: const Text('Expense'),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Select operation',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              operationType,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: AppColors.white30),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.white30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Amount money'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.white60),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFieldAppWidget(
                        controller: amountController, hintText: '\$0')
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'ICON',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.white60),
                      ),
                    ),
                    SizedBox(height: 5),
                    AppContainer(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                        ),
                        itemCount: icons.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIcon = icons[index];
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.orange15,
                                border: Border.all(
                                  color: selectedIcon == icons[index]
                                      ? AppColors.orange
                                      : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SvgPicture.asset(icons[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ActionButtonWidget(
                      text: 'Change',
                      width: double.infinity,
                      onTap: () {
                        if (nameController.text.isNotEmpty &&
                            amountController.text.isNotEmpty &&
                            int.parse(amountController.text) != null) {
                          final _opetarionType = operationType == 'Income'
                              ? OperationType.income
                              : OperationType.expense;
                          if (nameController.text != widget.operation.name ||
                              int.parse(amountController.text) !=
                                  widget.operation.amount || _opetarionType !=
                              widget.operation.type || selectedIcon != widget
                              .operation.icon) {
                            context.read<FinanceBloc>().add(EditOperationEvent(
                              operation: widget.operation,
                                editOperation: FinanceModel(
                                    amount: int.parse(amountController.text),
                                    name: nameController.text,
                                    icon: selectedIcon,
                                    type: operationType == 'Income'
                                        ? OperationType.income
                                        : OperationType.expense)));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.green,
                                content: Text(
                                  'Operation changed!',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            );
                            context.router.push(MainRoute());
                          } else {
                            context.router.push(MainRoute());
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.red,
                              content: Text(
                                'Firstly, enter information',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.read<FinanceBloc>().add(
                              DeleteOperationEvent(
                                  operation: widget.operation));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.red,
                              content: Text(
                                'Operation deleted!',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          );
                          context.router.push(MainRoute());
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
