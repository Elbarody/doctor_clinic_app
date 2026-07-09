import 'package:doctor_opportunity/core/helpers/app_regex.dart';
import 'package:doctor_opportunity/core/theming/Spacing.dart';
import 'package:doctor_opportunity/core/theming/colors.dart';
import 'package:doctor_opportunity/core/wedgets/app_text_form_field.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/password_validation_text.dart';
import 'package:doctor_opportunity/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpInputsForm extends StatefulWidget {
  const SignUpInputsForm({super.key});

  @override
  State<SignUpInputsForm> createState() => _SignUpInputsFormState();
}

class _SignUpInputsFormState extends State<SignUpInputsForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool hasMinLength = false;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool passwordsMatch = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    confirmPasswordController =
        context.read<SignUpCubit>().passwordConfirmationController;
    setPasswordControllerListener();
  }

  void setPasswordControllerListener() {
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasMinLength = AppRegex.hasMinLength(password, 6);
        isUpperCase = AppRegex.hasUpperCase(password);
        isLowerCase = AppRegex.hasLowerCase(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
      });
    });

    confirmPasswordController.addListener(() {
      final confirmPassword = confirmPasswordController.text;
      setState(() {
        passwordsMatch = passwordController.text == confirmPassword &&
            confirmPassword.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidName(value)) {
                return 'Please enter a valid name';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Phone Number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidPhoneNumber(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            obscureText: isPasswordObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            controller: passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.gray,
              ),
            ),
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Confirm Password',
            obscureText: isPasswordConfirmationObscureText,
            validator: (value) {
              if (value == null || value.isEmpty || !passwordsMatch) {
                return 'Passwords do not match';
              }
              return null;
            },
            controller: confirmPasswordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: ColorsManager.gray,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidationText(
            isLowerCase: isLowerCase,
            isUpperCase: isUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
            hasConfirmedPassword: true,
            passwordsMatch: passwordsMatch,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
