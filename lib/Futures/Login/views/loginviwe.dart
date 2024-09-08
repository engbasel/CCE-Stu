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

  // This function is called when the checkbox is checked
  void _onRememberMeChecked() {
    print("Remember me checked");
    // Add any additional functionality here, like saving preferences
  }

  // This function is called when the checkbox is unchecked
  void _onRememberMeUnchecked() {
    print("Remember me unchecked");
    // Add any additional functionality here
  }

  // Handles the change in the checkbox value
  void _handleRememberMeChanged(bool? value) {
    setState(() {
      _isRememberMeChecked = value!;

      if (_isRememberMeChecked) {
        _onRememberMeChecked(); // Run when checked
      } else {
        _onRememberMeUnchecked(); // Run when unchecked
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
              // Student ID Text Field with shadow
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    hintText: 'Student ID',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const CustomLabelHintText(
                showAsterisk: true,
                labelText: 'Enter your password',
              ),
              // Password Text Field with shadow
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextFormField(
                  obscureText:
                      !_isPasswordVisible, // toggle password visibility
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomCheckbox(
                        isChecked: _isRememberMeChecked,
                        onChanged: _handleRememberMeChanged,
                        onChecked: _onRememberMeChecked, // Run when checked
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontFamily: Fontsmanger.AbhayaLibreMeduiem,
                          color: ColorsManager.coustomLabelTextColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 16, // You can adjust the font size
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
              const SizedBox(height: 16),
              // Custom Login Button
              CustomButton(
                buttonColor: ColorsManager.buttonColor,
                height: 55,
                text: "Login",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
