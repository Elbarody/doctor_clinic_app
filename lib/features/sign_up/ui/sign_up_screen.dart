import 'package:doctor_opportunity/core/theming/Spacing.dart';
import 'package:doctor_opportunity/core/theming/styles.dart';
import 'package:doctor_opportunity/core/wedgets/app_text_button.dart';
import 'package:doctor_opportunity/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:doctor_opportunity/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctor_opportunity/features/sign_up/ui/widgets/aleardy_have_account_text.dart';
import 'package:doctor_opportunity/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:doctor_opportunity/features/sign_up/ui/widgets/sign_up_inputs_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                Text('Create Account', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(38),
                Column(
                  children: [
                    const SignUpInputsForm(),
                    verticalSpace(30),
                    AppTextButton(
                      text: 'Create account',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignUp(context);
                      },
                    ),
                    verticalSpace(24),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const AleardyHaveAccountText(),
                    const SignupBlocListener()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState?.validate() == true) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
