part of 'package:cce_app/Futures/auth/Login/views/loginviwe.dart';
class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return  Center(

      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Don’t have an account ? ",
          style: kTextStyle11grey.copyWith(fontSize: 14),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignupView();
                      },
                    ),
                  );
                },
                child: Text(
                  "Sign up",
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
