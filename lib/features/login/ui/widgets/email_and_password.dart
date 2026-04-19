import 'package:doctor_opportunity/core/helpers/app_regex.dart';
import 'package:doctor_opportunity/core/theming/colors.dart';
import 'package:doctor_opportunity/core/theming/spacing.dart';
import 'package:doctor_opportunity/core/wedgets/app_text_form_field.dart';
import 'package:doctor_opportunity/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/password_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  late TextEditingController passwordController;
  late TextEditingController emailController;

  bool hasMinLength = false;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setPasswordControllerListener();
    emailController = context.read<LoginCubit>().emailController;
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
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
            hintText: 'Password',
            obscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
