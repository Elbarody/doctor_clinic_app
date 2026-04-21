import 'package:doctor_opportunity/core/theming/Spacing.dart';
import 'package:doctor_opportunity/core/theming/colors.dart';
import 'package:doctor_opportunity/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidationText extends StatelessWidget {
  final bool isLowerCase;
  final bool isUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;
  final bool hasConfirmedPassword;
  final bool? passwordsMatch;

  const PasswordValidationText({
    super.key,
    required this.isLowerCase,
    required this.isUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
    required this.hasConfirmedPassword,
    this.passwordsMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildValidationRow('At least 8 characters', hasMinLength),
        verticalSpace(2),
        buildValidationRow('At least one uppercase letter', isUpperCase),
        verticalSpace(2),
        buildValidationRow('At least one lowercase letter', isLowerCase),
        verticalSpace(2),
        buildValidationRow('At least one number', hasNumber),
        verticalSpace(2),
        buildValidationRow(
            'At least one special character', hasSpecialCharacter),
        if (hasConfirmedPassword) ...[
          verticalSpace(2),
          buildValidationRow('Passwords match', passwordsMatch ?? false),
        ],
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13BlueRegular.copyWith(
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
            decoration:
                hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: Colors.green,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
