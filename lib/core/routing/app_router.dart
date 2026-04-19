import 'package:doctor_opportunity/core/di/dependancy_injection.dart';
import 'package:doctor_opportunity/core/routing/routes.dart';
import 'package:doctor_opportunity/features/home/ui/home_screen.dart';
import 'package:doctor_opportunity/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_opportunity/features/login/ui/login_screen.dart';
import 'package:doctor_opportunity/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this is used to pass data between screens
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
