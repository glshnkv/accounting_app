import 'package:accounting_app/router/router.dart';
import 'package:accounting_app/screens/settings/profile/profile_bloc/profile_bloc.dart';
import 'package:accounting_app/services/shared_preferences.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:accounting_app/widgets/action_button_widget.dart';
import 'package:accounting_app/widgets/textfield_app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  String gender = 'Male';

  @override
  void initState() {
    getProfileInfo();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void getProfileInfo() async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    firstNameController.text = storage.firstName;
    lastNameController.text = storage.lastName;
    gender = storage.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text(
          'My Profile',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/settings/avatar.svg'),
                  SizedBox(height: 15),
                  TextFieldAppWidget(
                      controller: firstNameController, hintText: 'First Name'),
                  SizedBox(height: 20),
                  TextFieldAppWidget(
                      controller: lastNameController, hintText: 'Last Name'),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                          actions: <CupertinoActionSheetAction>[
                            CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {
                                gender = 'Male';
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text('Male'),
                            ),
                            CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {
                                gender = 'Female';
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text('Female'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                          color: AppColors.darkGrey,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Your Gender',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                gender,
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
                  ActionButtonWidget(
                    text: 'Confirm',
                    width: double.infinity,
                    onTap: () {
                      if (firstNameController.text.isNotEmpty &&
                          lastNameController.text.isNotEmpty) {
                        context.read<ProfileBloc>().add(UpdateProfileInfoEvent(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            gender: gender));
                        context.router.push(MainRoute());
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
