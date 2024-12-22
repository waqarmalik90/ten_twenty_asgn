import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class SevenItemWidget extends StatelessWidget {
  const SevenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgSeatPrimary,
      height: 6.adaptSize,
      width: 6.adaptSize,
    );
  }
}
