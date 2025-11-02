import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/di/dependency_injection.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_course/features/login/ui/login_screen.dart';
import 'package:flutter_advanced_course/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as className)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => getIt<LoginCubit>(), child: const LoginScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No Route Found for ${settings.name}'))),
        );
    }
  }

  // Add routing logic here in the future
}
