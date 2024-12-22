import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/data/model/GenresResponse.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_text_style.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class TwoItemWidget extends StatelessWidget {
  final Genres? genres;
  const TwoItemWidget({Key? key, this.genres})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    var imglist = [ImageConstant.imgRectangle2235,
      ImageConstant.imgRectangle2236,
      ImageConstant.imgRectangle2237,
      ImageConstant.imgRectangle2238,
      ImageConstant.imgRectangle2239,
      ImageConstant.imgRectangle2240,
      ImageConstant.imgRectangle2241,
      ImageConstant.imgRectangle2242,
      ImageConstant.imgRectangle2243,
      ImageConstant.imgRectangle2244,
      ImageConstant.imgRectangle2245,
      ImageConstant.imgRectangle2246,
      ImageConstant.imgRectangle2247];

    final _random = new Random();

// generate a random index based on the list length
// and use it to retrieve the element
    var element = imglist[_random.nextInt(imglist.length)];

    return SizedBox(
      height: 100.v,
      width: 163.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: element,
            height: 100.v,
            width: 163.h,
            radius: BorderRadius.circular(
              10.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                bottom: 18.v,
              ),
              child: Text(
                genres?.name ?? "",
                style: CustomTextStyles.titleMediumWhiteA700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
