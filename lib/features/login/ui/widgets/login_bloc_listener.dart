import 'package:doctor_opportunity/core/helpers/extensions.dart';
import 'package:doctor_opportunity/core/routing/routes.dart';
import 'package:doctor_opportunity/core/theming/colors.dart';
import 'package:doctor_opportunity/core/theming/styles.dart';
import 'package:doctor_opportunity/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_opportunity/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              )),
            );
          },
          success: (response) {
            context.pop();
            context.pushNamed(Routes.home);
          },
          error: (errorMessage) {
            setupErrorAlertDialog(context, errorMessage);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorAlertDialog(BuildContext context, String errorMessage) {
    context.pop();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: ColorsManager.red,
                size: 32,
              ),
              title: const Text('Error'),
              content: Text(
                errorMessage,
                style: TextStyles.font15DarkBlueMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Got it',
                    style: TextStyles.font14BlueSemiBold,
                  ),
                )
              ],
            ));
  }
}
