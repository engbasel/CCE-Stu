import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Core/manager/FontsManger.dart';
import 'package:cce_app/Core/manager/imagesManger.dart';
import 'package:cce_app/Core/widgets/CustomButton.dart';
import 'package:cce_app/Core/widgets/CustomLabelHintText.dart';
import 'package:cce_app/Core/widgets/CustomTextFormField.dart';
import 'package:cce_app/Core/widgets/customcheckbox.dart';
import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  static const routeName = 'SignupView';

  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isRememberMeChecked = false;

  void _onRememberMeChecked() {
    print("Remember me checked");
  }

  void _onRememberMeUnchecked() {
    print("Remember me unchecked");
  }

  void _handleRememberMeChanged(bool? value) {
    setState(() {
      isRememberMeChecked = value!;
      if (isRememberMeChecked) {
        _onRememberMeChecked();
      } else {
        _onRememberMeUnchecked();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.backgroundScaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  Imagesmanger.factuleyofengginering,
                  scale: 2,
                ),
              ),
              SizedBox(height: height * 0.05),
              const CustomLabelHintText(
                showAsterisk: true,
                labelText: 'Enter your name',
              ),
              SizedBox(height: height * 0.003),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(hintText: 'First Name '),
                  ),
                  SizedBox(width: 10), // Spacing between the fields
                  Expanded(
                    child: CustomTextFormField(hintText: 'Last Name '),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CustomLabelHintText(
                labelText: 'Enter your email ',
                showAsterisk: true,
              ),
              SizedBox(height: height * 0.003),
              const CustomTextFormField(hintText: '*****@std.mans.edu.eg'),
              const SizedBox(height: 20),
              const CustomLabelHintText(
                labelText: 'Enter your password ',
                showAsterisk: true,
              ),
              SizedBox(height: height * 0.003),
              CustomTextFormField(
                hintText: 'Password',
                isPasswordField: true,
                isPasswordVisible: isPasswordVisible,
                onSuffixIconPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              const CustomLabelHintText(
                labelText: 'Confirm password ',
                showAsterisk: true,
              ),
              SizedBox(height: height * 0.003),
              CustomTextFormField(
                hintText: 'Enter the password again',
                isPasswordField: true,
                isPasswordVisible: isPasswordVisible,
                onSuffixIconPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckbox(
                    isChecked: isRememberMeChecked,
                    onChanged: _handleRememberMeChanged,
                    onChecked: _onRememberMeChecked,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.start,
                      "I understand and agree to the Stanley Terms of Service",
                      style: TextStyle(
                        fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                        color: ColorsManager.coustomLabelTextColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                buttonColor: ColorsManager.buttonColor,
                height: 55,
                text: "Create account",
                onPressed: () {},
              ),
              SizedBox(height: height * 0.01),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account?  ",
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
