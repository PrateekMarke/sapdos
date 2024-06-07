import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sapdos/presentation/pages/patient.dart';
import 'package:sapdos/presentation/views/responsive.dart';
import 'package:sapdos/presentation/views/app_colour.dart';

import 'package:sapdos/presentation/views/app_styles.dart';
import 'package:sapdos/welcome_screen/login_signup_btn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                      )),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.1),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' SAPDOS',
                              style: abrilFatface.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.2),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Login to your sapdos account or create one now.',
                          style: ralewayStyle.copyWith(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.055),
                      const SizedBox(height: 6.0),
                      Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: LoginAndSignupBtn()),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return  Patient();
                              },
                            ),
                          );
                          },
                          child: Text(
                            'Prcoceed as a guest',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
        