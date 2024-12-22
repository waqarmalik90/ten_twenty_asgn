import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';

// ignore: must_be_immutable
class FrameItemWidget extends StatelessWidget {
   final String genreName;

  FrameItemWidget({ required this.genreName});

  /*const FrameItemWidget({Key? key})
      : super(
          key: key,
        );*/

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 3.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        genreName,
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.pink300,
      selectedColor: theme.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          12.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
