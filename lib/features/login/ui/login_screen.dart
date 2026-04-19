import 'package:doctor_opportunity/core/theming/Spacing.dart';
import 'package:doctor_opportunity/core/theming/styles.dart';
import 'package:doctor_opportunity/core/wedgets/app_text_button.dart';
import 'package:doctor_opportunity/features/login/data/models/login_request_body.dart';
import 'package:doctor_opportunity/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/aleardy_have_account_text.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/email_and_password.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcom Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(38),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(38),
                    AppTextButton(
                      text: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(24),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const AleardyHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
    }
  }
}
