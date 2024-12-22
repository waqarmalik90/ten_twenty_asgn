import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/widgets/CustomColors.dart';

// ignore: must_be_immutable
class FortytwoItemWidget extends StatelessWidget {
  final String? date;
  const FortytwoItemWidget({Key? key, this.date})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 7.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          date ?? "",
          style: TextStyle(
            color: appTheme.whiteA700,
            fontSize: 12.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: false,
        backgroundColor: CustomColors.GetTicketsColor,
        selectedColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10.h,
          ),
        ),
        onSelected: (value) {},
      ),
    );
  }
}
