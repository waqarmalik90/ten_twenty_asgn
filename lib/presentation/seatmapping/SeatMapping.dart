import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/app_decoration.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_text_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/presentation/seatmapping/HallSeatingPlan.dart';
import 'package:ten_twenty_asgn/widgets/CustomColors.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_subtitle.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/custom_app_bar.dart';
import 'package:ten_twenty_asgn/widgets/custom_elevated_button.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';
import 'package:ten_twenty_asgn/widgets/fortytwo_item_widget.dart';

// ignore: must_be_immutable
class SeatMapping extends StatelessWidget {
  final String? movieName;
  final String? inDate;
  const SeatMapping({Key? key, this.movieName, this.inDate})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 92.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Text("Date",
                                  style: theme.textTheme.titleMedium))),
                      SizedBox(height: 11.v),
                      _buildMar(context),
                      SizedBox(height: 38.v),
                      _buildTime(context),
                      SizedBox(height: 4.v),
                      _buildView(context),
                      SizedBox(height: 10.v),
                      _buildPrice(context),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildSelectSeats(context)));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 76.v,
        leadingWidth: 43.h,
        leading: Container(
            height: 30.adaptSize,
            width: 30.adaptSize,
            margin: EdgeInsets.only(left: 13.h, top: 15.v, bottom: 31.v),
            child: Stack(alignment: Alignment.center, children: [
              CustomImageView(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  imagePath: ImageConstant.imgIconUpErrorcontainer,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.topLeft),
              CustomImageView(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  imagePath: ImageConstant.imgIconUpErrorcontainer,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.center)
            ])),
        centerTitle: true,
        title: Column(children: [
          AppbarSubtitle(
              text: movieName ?? "",
              margin: EdgeInsets.only(left: 31.h, right: 30.h)),
          SizedBox(height: 1.v),
          AppbarSubtitleTwo(text: "In theaters ${inDate ?? ""}")
        ]),
        styleType: Style.bgOutline);
  }

  /// Section Widget
  Widget _buildMar(BuildContext context) {
    List<String> monthdates = getDatesOfCurrentMonthFormatted();

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Wrap(
              //runSpacing: 12.v,
              //spacing: 5.h,
              children: List<Widget>.generate(
                  monthdates.length,
                  (index) => FortytwoItemWidget(
                        date: monthdates[index],
                      ))),
          /*CustomElevatedButton(
                  height: 32.v,
                  width: 67.h,
                  text: "9 Mar",
                  margin: EdgeInsets.only(left: 12.h),
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle:
                  CustomTextStyles.labelLargePrimaryContainerSemiBold)*/
        ])));
  }

  List<String> getDatesOfCurrentMonthFormatted() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int currentMonth = now.month;

    // Get the first and last day of the current month
    DateTime firstDayOfMonth = DateTime(currentYear, currentMonth, 1);
    DateTime lastDayOfMonth = DateTime(currentYear, currentMonth + 1, 0);

    // Generate a list of all dates in the desired format
    List<String> formattedDates = [];
    DateFormat dateFormat = DateFormat('d MMM');
    for (int i = 0; i < lastDayOfMonth.day; i++) {
      DateTime date = DateTime(currentYear, currentMonth, i + 1);
      formattedDates.add(dateFormat.format(date));
    }

    return formattedDates;
  }

  /// Section Widget
  Widget _buildTime(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("12:30", style: CustomTextStyles.labelLargePrimaryContainer_1),
          Padding(
              padding: EdgeInsets.only(left: 9.h),
              child: Text("Cinetech + hall 1",
                  style: CustomTextStyles.bodySmallPoppinsGray50001)),
          Spacer(),
          Text("13:30", style: CustomTextStyles.labelLargePrimaryContainer_1),
          Padding(
              padding: EdgeInsets.only(left: 9.h),
              child: Text("Cinetech + hall 1",
                  style: CustomTextStyles.bodySmallPoppinsGray50001))
        ])));
  }

  /// Section Widget
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 51.h, vertical: 16.v),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        height: 15.v,
                        width: 144.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(72.h),
                            border: Border.all(
                                color: theme.colorScheme.primary, width: 1.h),
                            gradient: LinearGradient(
                                begin: Alignment(0.5, 0),
                                end: Alignment(0.5, 0.14),
                                colors: [
                                  theme.colorScheme.primary.withOpacity(0.3),
                                  theme.colorScheme.primary.withOpacity(0.3)
                                ]))),
                    _buildFrame2(context),
                    SizedBox(height: 3.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatTealA40001,
                        seat4: ImageConstant.imgSeatTealA40001,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatTealA40001,
                        seat16: ImageConstant.imgSeatTealA40001,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPink300,
                        seat5: ImageConstant.imgSeatPink300,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPink300,
                        seat17: ImageConstant.imgSeatPink300,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatDeepPurple6002x3,
                        seat11: ImageConstant.imgSeatDeepPurple6002x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatTealA40001,
                        seat5: ImageConstant.imgSeatTealA40001,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatTealA40001,
                        seat17: ImageConstant.imgSeatTealA40001,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPrimary2x3,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPrimary2x3,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPrimary2x3,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPrimary2x3,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPrimary2x3,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPrimary2x3,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame3(context),
                    SizedBox(height: 6.v)
                  ]))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 51.h, vertical: 16.v),
                  decoration: AppDecoration.outlinePrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        height: 15.v,
                        width: 144.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(72.h),
                            border: Border.all(
                                color: theme.colorScheme.primary, width: 1.h),
                            gradient: LinearGradient(
                                begin: Alignment(0.5, 0),
                                end: Alignment(0.5, 0.14),
                                colors: [
                                  theme.colorScheme.primary.withOpacity(0.3),
                                  theme.colorScheme.primary.withOpacity(0.3)
                                ]))),
                    _buildFrame2(context),
                    SizedBox(height: 3.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatTealA40001,
                        seat4: ImageConstant.imgSeatTealA40001,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatTealA40001,
                        seat16: ImageConstant.imgSeatTealA40001,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPink300,
                        seat5: ImageConstant.imgSeatPink300,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPink300,
                        seat17: ImageConstant.imgSeatPink300,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatOnprimary,
                        seat11: ImageConstant.imgSeatOnprimary,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatTealA40001,
                        seat5: ImageConstant.imgSeatTealA40001,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatTealA40001,
                        seat17: ImageConstant.imgSeatTealA40001,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPrimary2x3,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPrimary2x3,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPrimary2x3,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPrimary2x3,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatGray500,
                        seat1: ImageConstant.imgSeatGray500,
                        seat2: ImageConstant.imgSeatPrimary2x3,
                        seat3: ImageConstant.imgSeatPrimary2x3,
                        seat4: ImageConstant.imgSeatGray500,
                        seat5: ImageConstant.imgSeatGray500,
                        seat6: ImageConstant.imgSeatPrimary2x3,
                        seat7: ImageConstant.imgSeatPrimary2x3,
                        seat8: ImageConstant.imgSeatGray500,
                        seat9: ImageConstant.imgSeatGray500,
                        seat10: ImageConstant.imgSeatPrimary2x3,
                        seat11: ImageConstant.imgSeatPrimary2x3,
                        seat12: ImageConstant.imgSeatGray500,
                        seat13: ImageConstant.imgSeatGray500,
                        seat14: ImageConstant.imgSeatPrimary2x3,
                        seat15: ImageConstant.imgSeatPrimary2x3,
                        seat16: ImageConstant.imgSeatGray500,
                        seat17: ImageConstant.imgSeatGray500,
                        seat18: ImageConstant.imgSeatPrimary2x3,
                        seat19: ImageConstant.imgSeatPrimary2x3,
                        seat20: ImageConstant.imgSeatGray500,
                        seat21: ImageConstant.imgSeatGray500),
                    SizedBox(height: 3.v),
                    _buildFrame1(context,
                        seat: ImageConstant.imgSeatPrimary2x3,
                        seat1: ImageConstant.imgSeatPrimary2x3,
                        seat2: ImageConstant.imgSeatGray500,
                        seat3: ImageConstant.imgSeatGray500,
                        seat4: ImageConstant.imgSeatPrimary2x3,
                        seat5: ImageConstant.imgSeatPrimary2x3,
                        seat6: ImageConstant.imgSeatGray500,
                        seat7: ImageConstant.imgSeatGray500,
                        seat8: ImageConstant.imgSeatPrimary2x3,
                        seat9: ImageConstant.imgSeatPrimary2x3,
                        seat10: ImageConstant.imgSeatGray500,
                        seat11: ImageConstant.imgSeatGray500,
                        seat12: ImageConstant.imgSeatPrimary2x3,
                        seat13: ImageConstant.imgSeatPrimary2x3,
                        seat14: ImageConstant.imgSeatGray500,
                        seat15: ImageConstant.imgSeatGray500,
                        seat16: ImageConstant.imgSeatPrimary2x3,
                        seat17: ImageConstant.imgSeatPrimary2x3,
                        seat18: ImageConstant.imgSeatGray500,
                        seat19: ImageConstant.imgSeatGray500,
                        seat20: ImageConstant.imgSeatPrimary2x3,
                        seat21: ImageConstant.imgSeatPrimary2x3),
                    SizedBox(height: 3.v),
                    _buildFrame3(context),
                    SizedBox(height: 6.v)
                  ])))
        ])));
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "From", style: CustomTextStyles.labelLargeGray50001),
                TextSpan(text: " "),
                TextSpan(
                    text: "50 ",
                    style: CustomTextStyles.labelLargePrimaryContainerBold),
                TextSpan(
                    text: "or", style: CustomTextStyles.labelLargeGray50001),
                TextSpan(text: " "),
                TextSpan(
                    text: "2500 bonus",
                    style: CustomTextStyles.labelLargePrimaryContainerBold)
              ]),
              textAlign: TextAlign.left),
          Padding(
              padding: EdgeInsets.only(left: 112.h),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "From",
                        style: CustomTextStyles.labelLargeGray50001),
                    TextSpan(text: " "),
                    TextSpan(
                        text: "75 ",
                        style: CustomTextStyles.labelLargePrimaryContainerBold),
                    TextSpan(
                        text: "or",
                        style: CustomTextStyles.labelLargeGray50001),
                    TextSpan(text: " "),
                    TextSpan(
                        text: "3000 bonus",
                        style: CustomTextStyles.labelLargePrimaryContainerBold)
                  ]),
                  textAlign: TextAlign.left))
        ])));
  }

  /// Section Widget
  Widget _buildSelectSeats(BuildContext context) {
    return CustomElevatedButton(
        text: "Select Seats",
        buttonStyle: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(CustomColors.GetTicketsColor),
          elevation: WidgetStateProperty.all<double>(0),
        ),
        margin: EdgeInsets.only(left: 26.h, right: 26.h, bottom: 26.v),
        onPressed: () {
          onTapSelectSeats(context);
        });
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String seat,
    required String seat1,
    required String seat2,
    required String seat3,
    required String seat4,
    required String seat5,
    required String seat6,
    required String seat7,
    required String seat8,
    required String seat9,
    required String seat10,
    required String seat11,
    required String seat12,
    required String seat13,
    required String seat14,
    required String seat15,
    required String seat16,
    required String seat17,
    required String seat18,
    required String seat19,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(imagePath: seat, height: 2.v, width: 3.h),
      CustomImageView(
          imagePath: seat1,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat2,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 8.h)),
      CustomImageView(
          imagePath: seat4,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat5,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat6,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat7,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat8,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat9,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat10,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat11,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat12,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat13,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat14,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat15,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat16,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 8.h)),
      CustomImageView(
          imagePath: seat17,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat18,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat19,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h))
    ]);
  }

  /// Common widget
  Widget _buildFrame1(
    BuildContext context, {
    required String seat,
    required String seat1,
    required String seat2,
    required String seat3,
    required String seat4,
    required String seat5,
    required String seat6,
    required String seat7,
    required String seat8,
    required String seat9,
    required String seat10,
    required String seat11,
    required String seat12,
    required String seat13,
    required String seat14,
    required String seat15,
    required String seat16,
    required String seat17,
    required String seat18,
    required String seat19,
    required String seat20,
    required String seat21,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(imagePath: seat, height: 2.v, width: 3.h),
      CustomImageView(
          imagePath: seat1,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat2,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat4,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 8.h)),
      CustomImageView(
          imagePath: seat5,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat6,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat7,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat8,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat9,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat10,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat11,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat12,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat13,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat14,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat15,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat16,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat17,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 8.h)),
      CustomImageView(
          imagePath: seat18,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat19,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat20,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: seat21,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h))
    ]);
  }

  /// Common widget
  Widget _buildFrame2(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500, height: 2.v, width: 3.h),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 8.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 8.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h))
    ]);
  }

  /// Common widget
  Widget _buildFrame3(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500, height: 2.v, width: 3.h),
      CustomImageView(
          imagePath: ImageConstant.imgSeatCyan300,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatCyan300,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 19.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 25.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatPrimary2x3,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatCyan300,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 19.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatCyan300,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h)),
      CustomImageView(
          imagePath: ImageConstant.imgSeatGray500,
          height: 2.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 2.h))
    ]);
  }

  /// Navigates to the sevenScreen when the action is triggered.
  onTapSelectSeats(BuildContext context) {
    //Navigator.pushNamed(context, AppRoutes.sevenScreen);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HallSeatingPlan(movieName: movieName, inDate: inDate),
        ));
  }
}
