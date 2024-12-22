import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class FourItemWidget extends StatelessWidget {
  const FourItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return

      Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.h,
        vertical: 3.v,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle2245,
            height: 100.v,
            width: 130.h,
            radius: BorderRadius.circular(
              10.h,
            ),
            margin: EdgeInsets.only(top: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 21.h,
              top: 28.v,
              bottom: 24.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 184.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          "Timless",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup19625114,
                        height: 4.v,
                        width: 20.h,
                        margin: EdgeInsets.only(top: 21.v),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                Text(
                  "Fantasy",
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
