import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_text_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';

// ignore: must_be_immutable
class AppbarSubtitleTwo extends StatelessWidget {
  AppbarSubtitleTwo({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.labelLargePrimary_1.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
