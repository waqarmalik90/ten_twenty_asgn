import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_button_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/widgets/custom_elevated_button.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

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
        child: CustomElevatedButton(
          height: 30.v,
          width: 171.h,
          text: "3 Results Found",
          leftIcon: Container(
            margin: EdgeInsets.only(right: 15.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconUp,
              height: 30.adaptSize,
              width: 30.adaptSize,
            ),
          ),
          buttonStyle: CustomButtonStyles.none,
          buttonTextStyle: theme.textTheme.titleMedium!,
        ),
      ),
    );
  }
}
