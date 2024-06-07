import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos/presentation/bloc/auth_bloc.dart';
import 'package:sapdos/presentation/bloc/auth_event.dart';
import 'package:sapdos/presentation/bloc/auth_state.dart';
import 'package:sapdos/presentation/pages/login_page.dart';
import 'package:sapdos/presentation/views/app_colour.dart';
import 'package:sapdos/presentation/views/app_icons.dart';
import 'package:sapdos/presentation/views/app_styles.dart';
import 'package:sapdos/presentation/views/responsive.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                        child: Image.asset(
                          'assets/images/sapdos.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context)
                      ? height * 0.032
                      : height * 0.12,
                ),
                color: AppColors.whiteColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: BlocProvider(
                    create: (context) => _authBloc,
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state.isSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
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
                                        fontSize: 35.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.1),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Register',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blueDarkColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.064),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Enter new account’s details',
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
                              const SizedBox(height: 5.0),
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
                              const SizedBox(height: 6.0),
                              Container(
                                height: 50.0,
                                width: width,
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  onChanged: (value) {
                                    _authBloc.add(AuthConfirmPasswordChanged(value));
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
                                    hintText: 'Enter confirm Password',
                                    hintStyle: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blueDarkColor.withOpacity(0.5),
                                      fontSize: 12.0,
                                    ),
                                    errorText: state.confirmPasswordError,
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
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              };
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blueDarkColor,
                                  elevation: 0,
                                ),
                                child: Text(
                                  "Register".toUpperCase(),
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
                                          return LoginScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Already have an account? Login',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
