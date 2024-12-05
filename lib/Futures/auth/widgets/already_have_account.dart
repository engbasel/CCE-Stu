part of  'package:cce_app/Futures/auth/Signup/views/Signupview.dart';
class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Already have an account?  ",
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
