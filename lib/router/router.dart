import 'package:accounting_app/screens/finance/add_operation/add_operation_screen.dart';
import 'package:accounting_app/screens/finance/edit_operation/edit_operation_screen.dart';
import 'package:accounting_app/models/finance_model.dart';
import 'package:accounting_app/screens/finance/finance_screen.dart';
import 'package:accounting_app/screens/main/main_screen.dart';
import 'package:accounting_app/screens/news/news_info/news_info_screen.dart';
import 'package:accounting_app/models/news_model.dart';
import 'package:accounting_app/screens/news/news_list/news_list_screen.dart';
import 'package:accounting_app/screens/quiz/quiz_info/quiz_info_screen.dart';
import 'package:accounting_app/screens/quiz/quiz_list/quiz_list_screen.dart';
import 'package:accounting_app/models/quiz_model.dart';
import 'package:accounting_app/screens/settings/profile/profile_screen.dart';
import 'package:accounting_app/screens/settings/settings_list/settings_list_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: SettingsListRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: NewsListRoute.page),
        AutoRoute(page: NewsInfoRoute.page),
        AutoRoute(page: QuizListRoute.page),
        AutoRoute(page: QuizInfoRoute.page),
        AutoRoute(page: FinanceRoute.page),
        AutoRoute(page: AddOperationRoute.page),
    AutoRoute(page: EditOperationRoute.page),

  ];
}
