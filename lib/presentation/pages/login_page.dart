import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos/presentation/bloc/auth_bloc.dart';
import 'package:sapdos/presentation/bloc/auth_event.dart';
import 'package:sapdos/presentation/bloc/auth_state.dart';
import 'package:sapdos/presentation/pages/doctor.dart';

import 'package:sapdos/presentation/pages/signin_page.dart';
import 'package:sapdos/presentation/views/app_colour.dart';
import 'package:sapdos/presentation/views/app_icons.dart';
import 'package:sapdos/presentation/views/app_styles.dart';
import 'package:sapdos/presentation/views/responsive.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _authBloc = AuthBloc();

 @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Responsive.isMobile(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      child: Center(
                          child: Image.asset('assets/images/sapdos.png', fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,)),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.whiteColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    bloc: _authBloc,
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: height * 0.2),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: ' SAPDOS',
                                  style: abrilFatface.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blueDarkColor,
                                    fontSize: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.1),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Welcome Back',
                              style: ralewayStyle.copyWith(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.064),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Enter existing account’s details',
                              style: ralewayStyle.copyWith(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.064),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                          ),
                          const SizedBox(height: 6.0),
                          Container(
                            height: 50.0,
                            width: width,
                            child: TextFormField(
                              controller: _emailController,
                              onChanged: (value) {
                                _authBloc.add(AuthEmailChanged(value));
                              },
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor,
                                fontSize: 12.0,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: AppColors.whiteColor,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppIcons.emailIcon),
                                ),
                                contentPadding: const EdgeInsets.only(top: 16.0),
                                hintText: 'Enter Email',
                                hintStyle: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueDarkColor.withOpacity(0.5),
                                  fontSize: 12.0,
                                ),
                                errorText: state.emailError,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6.0),
                          Container(
                            height: 50.0,
                            width: width,
                            child: TextFormField(
                              controller: _passwordController,
                              onChanged: (value) {
                                _authBloc.add(AuthPasswordChanged(value));
                              },
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor,
                                fontSize: 12.0,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: AppColors.whiteColor,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppIcons.eyeIcon),
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppIcons.lockIcon),
                                ),
                                contentPadding: const EdgeInsets.only(top: 16.0),
                                hintText: 'Enter Password',
                                hintStyle: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueDarkColor.withOpacity(0.5),
                                  fontSize: 12.0,
                                ),
                                errorText: state.passwordError,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: ralewayStyle.copyWith(
                                  fontSize: 12.0,
                                  color: AppColors.blueColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          ElevatedButton(
                            onPressed: () {
                              _authBloc.add(AuthSubmitted());
                              if (state.isSuccess) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DoctorScreen();
                                    },
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueDarkColor,
                              elevation: 0,
                            ),
                            child: Text(
                              "Login".toUpperCase(),
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SigninScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Not on Sapdos? Sign-up',
                                style: ralewayStyle.copyWith(
                                  fontSize: 12.0,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}