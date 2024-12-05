part of  'package:cce_app/Futures/auth/Signup/views/Signupview.dart';
class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key,required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: type=='register'?"Already have an account?  ": "  return to  ",
          style: kTextStyle11grey.copyWith(fontSize: 14),
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
                  style: kTextStyle14underline
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
