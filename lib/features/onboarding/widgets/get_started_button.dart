import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/extensions.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.pushnamed(Routes.loginScreen);
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
        maximumSize: Size.fromHeight(50.h),
        minimumSize: Size.fromHeight(50.h),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
      ),
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
