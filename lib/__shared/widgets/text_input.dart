import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_innovations/__shared/colors.dart';

class TextInputWidget extends StatelessWidget {
  final String prefixIcon;
  final String? suffixIcon;
  final bool readOnly;
  final TextEditingController controller;
  final String label;
  final Function()? onTap;

  const TextInputWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        hintStyle: TextStyle(
          color: AppColors.textContentColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        hintText: label,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 2,
          ),
          child: SvgPicture.asset(
            prefixIcon,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  suffixIcon!,
                  width: 10,
                  height: 10,
                ),
              )
            : null,
      ),
      controller: controller,
    );
  }
}
