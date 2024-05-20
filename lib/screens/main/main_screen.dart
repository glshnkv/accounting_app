import 'package:accounting_app/screens/finance/finance_screen.dart';
import 'package:accounting_app/screens/news/news_list/news_list_screen.dart';
import 'package:accounting_app/screens/quiz/quiz_list/quiz_list_screen.dart';
import 'package:accounting_app/screens/settings/settings_list/settings_list_screen.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  final _tabs = [FinanceScreen(), NewsListScreen(), QuizListScreen(), SettingsListScreen()];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: _tabs[_currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(color: AppColors.orange);
              } else {
                return IconThemeData(color: AppColors.grey);
              }
            }),
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.orange);
              }
              return TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey);
            }),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedIndex: _currentIndex,
            backgroundColor: AppColors.black,
            indicatorColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/finance.svg', color: AppColors.orange),
                icon: SvgPicture.asset('assets/images/tab-icons/finance.svg', color: AppColors.grey),
                label: 'Finance',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.orange),
                icon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.grey),
                label: 'News',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/quiz.svg', color: AppColors.orange),
                icon: SvgPicture.asset('assets/images/tab-icons/quiz.svg', color: AppColors.grey),
                label: 'Quiz',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.orange),
                icon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.grey),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
