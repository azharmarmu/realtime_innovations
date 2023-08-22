import 'package:flutter/material.dart';
import 'package:realtime_innovations/__shared/colors.dart';

class AppButtonWrapper extends StatelessWidget {
  final String label;
  final bool primaryButton;
  final Function() onTap;
  const AppButtonWrapper({
    super.key,
    required this.label,
    required this.primaryButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return primaryButton
        ? AppButton.primary(
            label: label,
            onTap: onTap,
          )
        : AppButton.secondary(
            label: label,
            onTap: onTap,
          );
  }
}

class AppButton extends StatelessWidget {
  final String label;
  late Color labelColor;
  late Color color;
  final double? width;
  final Function() onTap;
  final double? verticalPadding;

  AppButton.primary({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.verticalPadding,
  }) {
    this.labelColor = AppColors.primaryColor;
    this.color = AppColors.accentColor;
  }

  AppButton.secondary({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.verticalPadding,
  }) {
    this.labelColor = AppColors.accentColor;
    this.color = AppColors.accentSecondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 12,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: labelColor, fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
    );
  }
}
