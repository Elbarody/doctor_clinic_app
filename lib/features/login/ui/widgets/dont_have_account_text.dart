import 'package:doctor_opportunity/core/helpers/extensions.dart';
import 'package:doctor_opportunity/core/routing/routes.dart';
import 'package:doctor_opportunity/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
              text: 'Sign Up',
              style: TextStyles.font13BlueSemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.signUpScreen);
                }),
        ],
        style: TextStyles.font13BlueRegular,
      ),
    );
  }
}
