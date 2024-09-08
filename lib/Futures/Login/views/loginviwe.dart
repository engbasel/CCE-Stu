import 'package:cce_app/Core/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Core/manager/FontsManger.dart';
import 'package:cce_app/Core/manager/imagesManger.dart';
import 'package:cce_app/Core/widgets/CustomButton.dart';
import 'package:cce_app/Core/widgets/CustomLabelHintText.dart';
import 'package:cce_app/Core/widgets/customcheckbox.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false;
  bool _isRememberMeChecked = false;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onRememberMeChecked() {
    print("Remember me checked");
  }

  void _onRememberMeUnchecked() {
    print("Remember me unchecked");
  }

  void _handleRememberMeChanged(bool? value) {
    setState(() {
      _isRememberMeChecked = value!;
      if (_isRememberMeChecked) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    Imagesmanger.factuleyofengginering,
                    scale: 2,
                  )
                ],
              ),
              SizedBox(height: height * 0.15),
              const CustomLabelHintText(
                showAsterisk: true,
                labelText: 'Enter your ID',
              ),
              // Reuse CustomTextFormField for ID
              CustomTextFormField(
                hintText: 'Student ID',
                controller: _idController,
              ),
              SizedBox(height: height * 0.02),
              const CustomLabelHintText(
                showAsterisk: true,
                labelText: 'Enter your password',
              ),
              // Reuse CustomTextFormField for Password
              CustomTextFormField(
                hintText: 'Password',
                isPasswordField: true,
                isPasswordVisible: _isPasswordVisible,
                onSuffixIconPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                controller: _passwordController,
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomCheckbox(
                        isChecked: _isRememberMeChecked,
                        onChanged: _handleRememberMeChanged,
                        onChecked: _onRememberMeChecked,
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                          color: ColorsManager.coustomLabelTextColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              CustomButton(
                buttonColor: ColorsManager.buttonColor,
                height: 55,
                text: "Login",
                onPressed: () {},
              ),
              SizedBox(height: height * 0.01),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don’t have an account ? ",
                    style: TextStyle(
                      fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                          fontSize: 12,
                          color: Colors.blueGrey[800],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
