import 'package:accounting_app/router/router.dart';
import 'package:accounting_app/screens/settings/profile/profile_bloc/profile_bloc.dart';
import 'package:accounting_app/screens/settings/widgets/settings_tile.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsListScreen extends StatefulWidget {
  const SettingsListScreen({super.key});

  @override
  State<SettingsListScreen> createState() => _SettingsListScreenState();
}

class _SettingsListScreenState extends State<SettingsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                BlocProvider(
                  create: (context) => ProfileBloc()..add(GetProfileInfoEvent()),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is LoadedProfileInfoState) {
                        return Column(
                          children: [
                            SvgPicture.asset('assets/images/settings/avatar.svg'),
                            Text(
                              '${state.firstName} ${state.lastName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21,
                                  color: AppColors.white),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(height: 15),
                SettingsTile(
                  title: 'My Profile',
                  iconPath: 'assets/images/settings/profile.svg',
                  onTap: () {
                    context.router.push(ProfileRoute());
                  },
                ),
                SizedBox(height: 15),
                SettingsTile(
                  title: 'Ask of Question',
                  iconPath: 'assets/images/settings/ask.svg',
                  onTap: () {},
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/privacy.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white60,
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 1, color: AppColors.white30),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/terms.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Terms of Use',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white60,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/share.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Share app',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white60,
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 1, color: AppColors.white30),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/settings/rate.svg'),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Rate the app',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.white60,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SettingsTile(
                  title: 'About app',
                  iconPath: 'assets/images/settings/about.svg',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
