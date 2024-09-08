import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Core/manager/FontsManger.dart';
import 'package:cce_app/Core/manager/imagesManger.dart';
import 'package:cce_app/Core/widgets/CustomButton.dart';
import 'package:cce_app/Core/widgets/CustomLabelHintText.dart';
import 'package:cce_app/Core/widgets/CustomTextFormField.dart';
import 'package:cce_app/Futures/Login/views/loginviwe.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.backgroundScaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Imagesmanger.factuleyofengginering,
                  scale: 2,
                ),
              ],
            ),
            SizedBox(height: height * 0.15),
            const CustomLabelHintText(
              labelText: 'Enter your email ',
              showAsterisk: true,
            ),
            SizedBox(height: height * 0.003),
            const CustomTextFormField(hintText: 'Email'),
            SizedBox(height: height * 0.01),
            const Text(
              "Don’t worry if you forgot the password! Please enter your email and we'll send you reset instructions.",
              style: TextStyle(
                fontFamily: "Abhaya Libre Medium",
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xffb7adad),
                height: 24 / 10,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: height * 0.01),
            CustomButton(
              buttonColor: ColorsManager.buttonColor,
              height: 55,
              text: "Submit",
              onPressed: () {},
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Back to ",
                  style: TextStyle(
                    fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginView();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                            fontSize: 14,
                            color: Colors.blueGrey[800],
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
