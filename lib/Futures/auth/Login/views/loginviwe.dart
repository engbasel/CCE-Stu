import 'package:cce_app/Core/helpers/styles.dart';
import 'package:cce_app/Futures/Home/view/homeviwe.dart';
import 'package:cce_app/Futures/auth/ForgetPassword/views/ForgetPassword.dart';
import 'package:cce_app/Futures/auth/Signup/views/Signupview.dart';
import 'package:flutter/material.dart';
import 'package:cce_app/Core/manager/ColorsManager.dart';
import '../../../../Core/helpers/CustomButton.dart';
import '../../../../Core/helpers/CustomTextFormField.dart';
import '../../../Home/widget/customcheckbox.dart';
import '../../widgets/logo_name_app.dart';
part '../../widgets/donot_have_account.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const routeName = 'LoginView';

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;
  bool isRememberMeChecked = false;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.10),
              LogoOfAppWidget(),
              SizedBox(height: height * 0.15),
              const Text('  Enter your ID', style: kTextStyle15),
              SizedBox(height: height * 0.01),
              CustomTextFormField(
                hintText: 'student id',
                controller: _idController,
              ),
              SizedBox(height: height * 0.03),
              const Text('  Enter your password', style: kTextStyle15),
              SizedBox(height: height * 0.01),
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
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomCheckbox(
                        isChecked: isRememberMeChecked,
                      ),
                      Text("Remember me", style: kTextStyle14),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Forgetpassword();
                        },
                      ));
                    },
                    child: TextButton(
                      onPressed: () {},
                      child:
                          Text(" Forget password ?", style: kTextStyle11grey),
                    ),
                  )
                ],
              ),
              CustomButton(
                buttonColor: ColorsManager.buttonColor,
                height: 50,
                text: "Login",
                onPressed: () {
                  // Add your login logic here
                  Navigator.popAndPushNamed(context, HomeView.routeName);
                },
              ),
              SizedBox(height: height * 0.01),
              DoNotHaveAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
