import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sapdos/presentation/views/responsive.dart';
import 'package:sapdos/presentation/views/app_colour.dart';

import 'package:sapdos/presentation/views/app_styles.dart';



 class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

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
                      SizedBox(height: 40),
                      // Image.asset(
                      //   'assets/images/image.png', // Ensure the correct path to your image
                      //   fit: BoxFit.cover,
                      //   width: 150,
                      //   height: 150,
                      // ),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: 'Card',
                              items: ['Card', 'UPI','Net Banking']
                                  .map((method) => DropdownMenuItem<String>(
                                        value: method,
                                        child: Text(method),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Select the mode of payment you prefer',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Enter your details below',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Card Number',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Card Holder',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'MM/YY',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'CVV',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Center(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle pay now action
                                },
                                icon: Icon(Icons.payment),
                                label: Text('Pay now'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blueDarkColor,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  textStyle: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
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


