import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
import 'package:flutter/material.dart';
import '../../../../Core/helpers/CustomButton.dart';
import '../../../../Core/helpers/CustomTextFormField.dart';
import '../../../../Core/helpers/styles.dart';
import '../../../Home/widget/customcheckbox.dart';
import '../../widgets/logo_name_app.dart';
part '../../widgets/first_last_name.dart';
part 'package:cce_app/Futures/auth/widgets/already_have_account.dart';
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final space = SizedBox(height: height * 0.01);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.10),
              LogoOfAppWidget(),
              SizedBox(height: height * 0.05),
              const Text('  Enter your name',style:kTextStyle15),
              space,
              const FirstAndLastNameWidget(),
              const SizedBox(height: 8),
              const Text('  Enter your email',style:kTextStyle15),
              space,
              const CustomTextFormField(hintText: '*****@std.mans.edu.eg'),
              const SizedBox(height: 8),
              const Text('  Enter your password',style:kTextStyle15),
              space,
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
              const SizedBox(height: 8),
              const Text('  Confirm password',style:kTextStyle15),
              space,
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
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "I understand and agree to the Stanley\n Terms of Service",
                    style: kTextStyle14
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                buttonColor: ColorsManager.buttonColor,
                height: 50,
                text: "Create account",
                onPressed: () {},
              ),
              space,
              AlreadyHaveAccountWidget(type: "register",),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
