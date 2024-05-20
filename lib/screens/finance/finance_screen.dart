import 'package:accounting_app/models/finance_model.dart';
import 'package:accounting_app/router/router.dart';
import 'package:accounting_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:accounting_app/screens/finance/widgets/amount_widget.dart';
import 'package:accounting_app/screens/settings/profile/profile_bloc/profile_bloc.dart';
import 'package:accounting_app/screens/settings/profile/profile_bloc/profile_bloc.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:accounting_app/widgets/app_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

@RoutePage()
class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final controller = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => ProfileBloc()..add(GetProfileInfoEvent()),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is LoadedProfileInfoState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/settings/avatar.svg',
                            width: 35,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${state.firstName} ${state.lastName}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(height: 15),
            BlocProvider(
              create: (context) => FinanceBloc()..add(GetFinanceInfoEvent()),
              child: BlocBuilder<FinanceBloc, FinanceState>(
                builder: (context, state) {
                  if (state is EmptyFinanceInfoState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: AppContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Balance',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.white60),
                                ),
                                Text(
                                  '\$0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                context.router.push(AddOperationRoute());
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: AppColors.white10,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0))),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (state is LoadedFinanceInfoState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppContainer(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your Balance',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.white60),
                                        ),
                                        Text(
                                          '\$${state.balance}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 32,
                                              color: AppColors.white),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.router
                                            .push(AddOperationRoute());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: AppColors.white10,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0))),
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: AmountWidget(
                                          icon:
                                              'assets/images/elements/income.svg',
                                          title: 'Income',
                                          content: '\$${state.income}'),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: AmountWidget(
                                          icon:
                                              'assets/images/elements/expense.svg',
                                          title: 'Expense',
                                          content: '\$${state.expenses}'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: FlutterToggleTab(
                            isScroll: false,
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.22,
                            borderRadius: 8,
                            selectedBackgroundColors: [AppColors.orange],
                            unSelectedBackgroundColors: [AppColors.darkGrey],
                            selectedTextStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.white),
                            unSelectedTextStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.white60),
                            labels: ['All', 'Income', 'Expense'],
                            selectedIndex: _currentIndex,
                            selectedLabelIndex: (index) {
                              _currentIndex = index;
                              controller.animateToPage(_currentIndex,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.425,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {});
                            },
                            controller: controller,
                            children: [
                              ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                itemCount: state.allOperations.length,
                                shrinkWrap: true,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(height: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  final _operation = state.allOperations[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.router.push(EditOperationRoute(operation: _operation));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 1,
                                              backgroundColor: AppColors.red,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                              onPressed: (context) {
                                                context.read<FinanceBloc>().add(
                                                    DeleteOperationEvent(
                                                        operation: _operation));
                                                context.router.push(MainRoute());
                                              },
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: AppColors.darkGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  color: AppColors.orange15,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                      _operation.icon),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _operation.name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 18,
                                                          color:
                                                              AppColors.white),
                                                    ),
                                                    Text(
                                                      _operation.type ==
                                                              OperationType
                                                                  .income
                                                          ? 'Income'
                                                          : 'Expenses',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .white60),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              _operation.type ==
                                                      OperationType.income
                                                  ? Text(
                                                      '+\$${_operation.amount}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          color:
                                                              AppColors.green),
                                                    )
                                                  : Text(
                                                      '-\$${_operation.amount}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          color: AppColors.red),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                itemCount: state.incomeOperations.length,
                                shrinkWrap: true,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                const SizedBox(height: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  final _operation = state.incomeOperations[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.router.push(EditOperationRoute(operation: _operation));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 1,
                                              backgroundColor: AppColors.red,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                              onPressed: (context) {
                                                context.read<FinanceBloc>().add(
                                                    DeleteOperationEvent(
                                                        operation: _operation));
                                                context.router.push(MainRoute());
                                              },
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: AppColors.darkGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  color: AppColors.orange15,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                      _operation.icon),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _operation.name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 18,
                                                          color:
                                                          AppColors.white),
                                                    ),
                                                    Text(
                                                      _operation.type ==
                                                          OperationType
                                                              .income
                                                          ? 'Income'
                                                          : 'Expenses',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .white60),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              _operation.type ==
                                                  OperationType.income
                                                  ? Text(
                                                '+\$${_operation.amount}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 16,
                                                    color:
                                                    AppColors.green),
                                              )
                                                  : Text(
                                                '-\$${_operation.amount}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 16,
                                                    color: AppColors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                itemCount: state.expensesOperations.length,
                                shrinkWrap: true,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                const SizedBox(height: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  final _operation = state.expensesOperations[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.router.push(EditOperationRoute(operation: _operation));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 1,
                                              backgroundColor: AppColors.red,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                              onPressed: (context) {
                                                context.read<FinanceBloc>().add(
                                                    DeleteOperationEvent(
                                                        operation: _operation));
                                                context.router.push(MainRoute());
                                              },
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: AppColors.darkGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  color: AppColors.orange15,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                      _operation.icon),
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _operation.name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 18,
                                                          color:
                                                          AppColors.white),
                                                    ),
                                                    Text(
                                                      _operation.type ==
                                                          OperationType
                                                              .income
                                                          ? 'Income'
                                                          : 'Expenses',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .white60),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              _operation.type ==
                                                  OperationType.income
                                                  ? Text(
                                                '+\$${_operation.amount}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 16,
                                                    color:
                                                    AppColors.green),
                                              )
                                                  : Text(
                                                '-\$${_operation.amount}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 16,
                                                    color: AppColors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                            ],
                          ),
                        )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
