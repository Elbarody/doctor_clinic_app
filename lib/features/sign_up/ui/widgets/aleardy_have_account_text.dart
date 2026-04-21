import 'package:doctor_opportunity/core/helpers/extensions.dart';
import 'package:doctor_opportunity/core/routing/routes.dart';
import 'package:doctor_opportunity/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AleardyHaveAccountText extends StatelessWidget {
  const AleardyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Aleardy have an account? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
              text: 'Log in',
              style: TextStyles.font13BlueSemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.loginScreen);
                }),
        ],
        style: TextStyles.font13BlueRegular,
      ),
    );
  }
}
