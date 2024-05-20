import 'package:accounting_app/accounting_app.dart';
import 'package:accounting_app/models/finance_model.dart';
import 'package:accounting_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:accounting_app/screens/settings/profile/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  Hive.registerAdapter(OperationTypeAdapter());
  await Hive.openBox('finances');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<FinanceBloc>(create: (context) => FinanceBloc()),

      ],
      child: AccountingApp(),
    ),
  );
}
