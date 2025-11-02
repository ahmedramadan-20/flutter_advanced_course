import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/extensions.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/styles.dart';

class LoginBlockListener extends StatelessWidget {
  const LoginBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(child: CircularProgressIndicator()),
            );
          },
          success: (loginResponse) {
            // hide loading indicator
            context.pop();
            // navigate to home screen or show success message
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            // show error message
            setupErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    // hide loading indicator
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
