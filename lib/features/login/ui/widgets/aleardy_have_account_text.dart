import 'package:doctor_opportunity/core/theming/styles.dart';
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
          TextSpan(text: 'Sign Up', style: TextStyles.font13BlueSemiBold),
        ],
        style: TextStyles.font13BlueRegular,
      ),
    );
  }
}
