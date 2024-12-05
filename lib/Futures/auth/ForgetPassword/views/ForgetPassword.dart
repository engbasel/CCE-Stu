import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Core/manager/FontsManger.dart';
import 'package:cce_app/Core/manager/imagesManger.dart';
import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:cce_app/Futures/auth/Signup/views/Signupview.dart';
import 'package:flutter/material.dart';

import '../../../../Core/helpers/CustomButton.dart';
import '../../../../Core/helpers/CustomLabelHintText.dart';
import '../../../../Core/helpers/CustomTextFormField.dart';
import '../../../../Core/helpers/styles.dart';
import '../../widgets/logo_name_app.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),
            LogoOfAppWidget(),
            SizedBox(height: height * 0.10),
            Text('  Enter your email',style:kTextStyle15),
            SizedBox(height: height * 0.01),
            const CustomTextFormField(hintText: 'Email'),
            SizedBox(height: height * 0.02),
            const Text(
              "  Don’t worry if you forgot the password! Please enter your email\n  and we'll send you reset instructions.",
              style:kTextStyle11grey,

            ),
            SizedBox(height: height * 0.03),
            CustomButton(
              buttonColor: ColorsManager.buttonColor,
              height: 50,
              text: "Submit",
              onPressed: () {},
            ),
            SizedBox(height: height * 0.02),

            AlreadyHaveAccountWidget(type: "foget",)
          ],
        ),
      ),
    );
  }
}
