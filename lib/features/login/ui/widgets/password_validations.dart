import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/spacing.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialCharacters;
  final bool hasNumbers;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    re,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialCharacters,
    required this.hasNumbers,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least one lowercase letter', hasLowercase),
        verticalSpace(2),
        buildValidationRow('At least one uppercase letter', hasUppercase),
        verticalSpace(2),
        buildValidationRow('At least one special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least one number', hasNumbers),
        verticalSpace(2),
        buildValidationRow('Minimum 8 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(radius: 2.5, backgroundColor: ColorsManager.grey),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.grey : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
