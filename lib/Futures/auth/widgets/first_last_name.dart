part of 'package:cce_app/Futures/auth/Signup/views/Signupview.dart';

class FirstAndLastNameWidget extends StatelessWidget {
  const FirstAndLastNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: CustomTextFormField(
          hintText: 'First Name ',
          validator: (p0) {
            return null;
          },
        ),
      ),
      SizedBox(width: 10), // Spacing between the fields
      Expanded(
        child: CustomTextFormField(
          hintText: 'Last Name ',
          validator: (p0) {
            return null;
          },
        ),
      ),
    ]);
  }
}
