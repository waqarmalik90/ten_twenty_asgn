import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/app_decoration.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_button_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_text_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/widgets/CustomColors.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_subtitle.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/custom_app_bar.dart';
import 'package:ten_twenty_asgn/widgets/custom_checkbox_button.dart';
import 'package:ten_twenty_asgn/widgets/custom_elevated_button.dart';
import 'package:ten_twenty_asgn/widgets/custom_icon_button.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';
import 'package:ten_twenty_asgn/widgets/fortytwo_item_widget.dart';
import 'package:ten_twenty_asgn/widgets/seven_item_widget.dart';

// ignore: must_be_immutable
class HallSeatingPlan extends StatelessWidget {

  final String? movieName;
  final String? inDate;
  bool selected = false;

  bool notavailable = false;

  bool vip = false;

  bool regularFifty = false;

   HallSeatingPlan({Key? key, this.movieName, this.inDate})
      : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return

      SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 62.v),
                        _buildFortyNine(context),
                        SizedBox(height: 134.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 10.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomIconButton(
                                          height: 29.adaptSize,
                                          width: 29.adaptSize,
                                          padding: EdgeInsets.all(9.h),
                                          child: CustomImageView(
                                              imagePath:
                                              ImageConstant.imgFrame11902)),
                                      Container(
                                          margin: EdgeInsets.only(left: 6.h),
                                          padding: EdgeInsets.all(8.h),
                                          decoration: AppDecoration
                                              .outlineOnPrimaryContainer1
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder14),
                                          child: Container(
                                              height: 10.adaptSize,
                                              width: 10.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3.v),
                                              decoration:
                                              AppDecoration.fillWhiteA,
                                              child: CustomImageView(
                                                  imagePath:
                                                  ImageConstant.imgVector,
                                                  height: 1.v,
                                                  width: 9.h,
                                                  alignment:
                                                  Alignment.bottomCenter)))
                                    ]))),
                        SizedBox(height: 25.v),
                        _buildEight(context)
                      ]))));
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
                  imagePath: ImageConstant.imgIconUpErrorcontainer,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.topLeft,
                onTap: () { Navigator.pop(context); } ,),
              CustomImageView(
                  onTap: () { Navigator.pop(context); } ,
                  imagePath: ImageConstant.imgIconUpErrorcontainer,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.center)
            ])),
        centerTitle: true,
        title: Column(children: [
          AppbarSubtitle(
              text: movieName ?? "",
              margin: EdgeInsets.only(left: 19.h, right: 18.h)),
          SizedBox(height: 1.v),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "${inDate ?? ""}  ",
                    style: CustomTextStyles.labelLargePrimary_2),
                TextSpan(
                    text: "I  12:30 hall 1",
                    style: CustomTextStyles.labelLargePrimary)
              ]),
              textAlign: TextAlign.left)
        ]),
        styleType: Style.bgOutline);
  }

  /// Section Widget
  Widget _buildFortyNine(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 23.h),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.only(top: 39.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text("1",
                            style: CustomTextStyles.poppinsPrimaryContainer)),
                    SizedBox(height: 7.v),
                    Text("2", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 6.v),
                    Text("3", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 5.v),
                    Text("4", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 6.v),
                    Text("5", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 6.v),
                    Text("6", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 7.v),
                    Text("7", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 6.v),
                    Text("8", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 6.v),
                    Text("9", style: CustomTextStyles.poppinsPrimaryContainer),
                    SizedBox(height: 6.v),
                    Align(
                        alignment: Alignment.center,
                        child: Text("10",
                            style: CustomTextStyles.poppinsPrimaryContainer))
                  ])),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(children: [
                    SizedBox(
                        height: 34.v,
                        width: 327.h,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgEllipse36,
                              height: 34.v,
                              width: 327.h,
                              alignment: Alignment.center),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 8.v),
                                  child: Text("screen".toUpperCase(),
                                      style: theme.textTheme.labelSmall)))
                        ])),
                    SizedBox(height: 7.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 18.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeatPrimary,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 18.h)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSeat,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h))
                            ])),
                    SizedBox(height: 8.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 7.v,
                                crossAxisCount: 22,
                                mainAxisSpacing: 5.h,
                                crossAxisSpacing: 5.h),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 66,
                            itemBuilder: (context, index) {
                              return SevenItemWidget();
                            })),
                    SizedBox(height: 8.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatPrimary,
                        seat1: ImageConstant.imgSeatPrimary,
                        seat2: ImageConstant.imgSeat,
                        seat3: ImageConstant.imgSeat,
                        seat4: ImageConstant.imgSeat,
                        seat5: ImageConstant.imgSeatPrimary,
                        seat6: ImageConstant.imgSeatPrimary,
                        seat7: ImageConstant.imgSeat,
                        seat8: ImageConstant.imgSeat,
                        seat9: ImageConstant.imgSeatPrimary,
                        seat10: ImageConstant.imgSeatPrimary,
                        seat11: ImageConstant.imgSeat,
                        seat12: ImageConstant.imgSeat,
                        seat13: ImageConstant.imgSeatPrimary,
                        seat14: ImageConstant.imgSeatPrimary,
                        seat15: ImageConstant.imgSeat,
                        seat16: ImageConstant.imgSeat,
                        seat17: ImageConstant.imgSeatPrimary,
                        seat18: ImageConstant.imgSeatPrimary,
                        seat19: ImageConstant.imgSeat,
                        seat20: ImageConstant.imgSeat,
                        seat21: ImageConstant.imgSeat,
                        seat22: ImageConstant.imgSeatPrimary,
                        seat23: ImageConstant.imgSeatPrimary),
                    SizedBox(height: 8.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeat,
                        seat1: ImageConstant.imgSeat,
                        seat2: ImageConstant.imgSeatPrimary,
                        seat3: ImageConstant.imgSeatPrimary,
                        seat4: ImageConstant.imgSeat,
                        seat5: ImageConstant.imgSeat,
                        seat6: ImageConstant.imgSeat,
                        seat7: ImageConstant.imgSeatPrimary,
                        seat8: ImageConstant.imgSeatPrimary,
                        seat9: ImageConstant.imgSeat,
                        seat10: ImageConstant.imgSeat,
                        seat11: ImageConstant.imgSeatPrimary,
                        seat12: ImageConstant.imgSeatPrimary,
                        seat13: ImageConstant.imgSeat,
                        seat14: ImageConstant.imgSeat,
                        seat15: ImageConstant.imgSeatPrimary,
                        seat16: ImageConstant.imgSeatPrimary,
                        seat17: ImageConstant.imgSeat,
                        seat18: ImageConstant.imgSeat,
                        seat19: ImageConstant.imgSeat,
                        seat20: ImageConstant.imgSeatPrimary,
                        seat21: ImageConstant.imgSeatPrimary,
                        seat22: ImageConstant.imgSeat,
                        seat23: ImageConstant.imgSeat),
                    SizedBox(height: 8.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatPrimary,
                        seat1: ImageConstant.imgSeatPrimary,
                        seat2: ImageConstant.imgSeat,
                        seat3: ImageConstant.imgSeat,
                        seat4: ImageConstant.imgSeat,
                        seat5: ImageConstant.imgSeatPrimary,
                        seat6: ImageConstant.imgSeatPrimary,
                        seat7: ImageConstant.imgSeat,
                        seat8: ImageConstant.imgSeat,
                        seat9: ImageConstant.imgSeatPrimary,
                        seat10: ImageConstant.imgSeatPrimary,
                        seat11: ImageConstant.imgSeat,
                        seat12: ImageConstant.imgSeat,
                        seat13: ImageConstant.imgSeatPrimary,
                        seat14: ImageConstant.imgSeatPrimary,
                        seat15: ImageConstant.imgSeat,
                        seat16: ImageConstant.imgSeat,
                        seat17: ImageConstant.imgSeatPrimary,
                        seat18: ImageConstant.imgSeatPrimary,
                        seat19: ImageConstant.imgSeat,
                        seat20: ImageConstant.imgSeat,
                        seat21: ImageConstant.imgSeat,
                        seat22: ImageConstant.imgSeatPrimary,
                        seat23: ImageConstant.imgSeatPrimary),
                    SizedBox(height: 8.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeat,
                        seat1: ImageConstant.imgSeat,
                        seat2: ImageConstant.imgSeatPrimary,
                        seat3: ImageConstant.imgSeatPrimary,
                        seat4: ImageConstant.imgSeat,
                        seat5: ImageConstant.imgSeat,
                        seat6: ImageConstant.imgSeat,
                        seat7: ImageConstant.imgSeatPrimary,
                        seat8: ImageConstant.imgSeatPrimary,
                        seat9: ImageConstant.imgSeat,
                        seat10: ImageConstant.imgSeat,
                        seat11: ImageConstant.imgSeatPrimary,
                        seat12: ImageConstant.imgSeatPrimary,
                        seat13: ImageConstant.imgSeat,
                        seat14: ImageConstant.imgSeat,
                        seat15: ImageConstant.imgSeatPrimary,
                        seat16: ImageConstant.imgSeatPrimary,
                        seat17: ImageConstant.imgSeat,
                        seat18: ImageConstant.imgSeat,
                        seat19: ImageConstant.imgSeat,
                        seat20: ImageConstant.imgSeatPrimary,
                        seat21: ImageConstant.imgSeatPrimary,
                        seat22: ImageConstant.imgSeat,
                        seat23: ImageConstant.imgSeat),
                    SizedBox(height: 8.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatPrimary,
                        seat1: ImageConstant.imgSeatPrimary,
                        seat2: ImageConstant.imgSeat,
                        seat3: ImageConstant.imgSeat,
                        seat4: ImageConstant.imgSeat,
                        seat5: ImageConstant.imgSeatPrimary,
                        seat6: ImageConstant.imgSeatPrimary,
                        seat7: ImageConstant.imgSeat,
                        seat8: ImageConstant.imgSeat,
                        seat9: ImageConstant.imgSeatPrimary,
                        seat10: ImageConstant.imgSeatPrimary,
                        seat11: ImageConstant.imgSeat,
                        seat12: ImageConstant.imgSeat,
                        seat13: ImageConstant.imgSeatPrimary,
                        seat14: ImageConstant.imgSeatPrimary,
                        seat15: ImageConstant.imgSeat,
                        seat16: ImageConstant.imgSeat,
                        seat17: ImageConstant.imgSeatPrimary,
                        seat18: ImageConstant.imgSeatPrimary,
                        seat19: ImageConstant.imgSeat,
                        seat20: ImageConstant.imgSeat,
                        seat21: ImageConstant.imgSeat,
                        seat22: ImageConstant.imgSeatPrimary,
                        seat23: ImageConstant.imgSeatPrimary),
                    SizedBox(height: 8.v),
                    _buildFrame(context,
                        seat: ImageConstant.imgSeatDeepPurple600,
                        seat1: ImageConstant.imgSeatDeepPurple600,
                        seat2: ImageConstant.imgSeatDeepPurple600,
                        seat3: ImageConstant.imgSeatDeepPurple600,
                        seat4: ImageConstant.imgSeatDeepPurple600,
                        seat5: ImageConstant.imgSeatDeepPurple600,
                        seat6: ImageConstant.imgSeatDeepPurple600,
                        seat7: ImageConstant.imgSeatDeepPurple600,
                        seat8: ImageConstant.imgSeatDeepPurple600,
                        seat9: ImageConstant.imgSeatBlueGray100,
                        seat10: ImageConstant.imgSeatDeepPurple600,
                        seat11: ImageConstant.imgSeatDeepPurple600,
                        seat12: ImageConstant.imgSeatDeepPurple600,
                        seat13: ImageConstant.imgSeatDeepPurple600,
                        seat14: ImageConstant.imgSeatDeepPurple600,
                        seat15: ImageConstant.imgSeatDeepPurple600,
                        seat16: ImageConstant.imgSeatDeepPurple600,
                        seat17: ImageConstant.imgSeatDeepPurple600,
                        seat18: ImageConstant.imgSeatDeepPurple600,
                        seat19: ImageConstant.imgSeatDeepPurple600,
                        seat20: ImageConstant.imgSeatDeepPurple600,
                        seat21: ImageConstant.imgSeatDeepPurple600,
                        seat22: ImageConstant.imgSeatDeepPurple600,
                        seat23: ImageConstant.imgSeatDeepPurple600)
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h, right: 81.h),
              child: Row(
                  children: [
                CustomCheckboxButton(
                    text: "Selected",
                    value: selected,
                    onChange: (value) {
                      selected = value;
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 60.h),
                    child: CustomCheckboxButton(
                        text: "Not available",
                        value: notavailable,
                        onChange: (value) {
                          notavailable = value;
                        }))
              ])),
          SizedBox(height: 14.v),
          Padding(
              padding: EdgeInsets.only(left: 1.h, right: 75.h),
              child: Row(children: [
                CustomCheckboxButton(
                    text: "VIP (150)",
                    value: vip,
                    onChange: (value) {
                      vip = value;
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 52.h),
                    child: CustomCheckboxButton(
                        text: "Regular (50 )",
                        value: regularFifty,
                        onChange: (value) {
                          regularFifty = value;
                        }))
              ])),
          SizedBox(height: 31.v),
          Container(
              margin: EdgeInsets.only(left: 1.h),
              padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 4.v),
              decoration: AppDecoration.fillGray500.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "4 ",
                              style: CustomTextStyles
                                  .titleSmallPrimaryContainerMedium),
                          TextSpan(
                              text: "/",
                              style: CustomTextStyles.bodyMedium_1)
                        ]),
                        textAlign: TextAlign.left),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 3.h, top: 3.v, bottom: 2.v),
                        child: Text("3 row",
                            style: CustomTextStyles
                                .bodySmallPoppinsPrimaryContainer)),
                    CustomImageView(
                        imagePath:
                        ImageConstant.imgFrame11902Primarycontainer,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                        margin: EdgeInsets.only(
                            left: 13.h, top: 2.v, bottom: 3.v))
                  ])),
          SizedBox(height: 35.v),
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 5.v),
                        decoration: AppDecoration.fillGray500.copyWith(
                            borderRadius:
                            BorderRadiusStyle.roundedBorder10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 1.v),
                              Text("Total Price",
                                  style: CustomTextStyles
                                      .bodySmallPoppinsPrimaryContainer),
                              Text(" 50",
                                  style:
                                  CustomTextStyles.titleMediumSemiBold)
                            ])),
                    CustomElevatedButton(
                        buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.GetTicketsColor),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        width: 216.h, text: "Proceed to pay")
                  ]))
        ]);
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
        required String seat20,
        required String seat21,
        required String seat22,
        required String seat23,
      }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(imagePath: seat, height: 6.adaptSize, width: 6.adaptSize),
      CustomImageView(
          imagePath: seat1,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat2,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat3,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat4,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat5,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 18.h)),
      CustomImageView(
          imagePath: seat6,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat7,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat8,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat9,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat10,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat11,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat12,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat13,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat14,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat15,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat16,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat17,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat18,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat19,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 18.h)),
      CustomImageView(
          imagePath: seat20,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat21,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat22,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: seat23,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h))
    ]);
  }

  /// Navigates to the oneContainerScreen when the action is triggered.
  onTapImgIconUP(BuildContext context) {
    //Navigator.pushNamed(context, AppRoutes.oneContainerScreen);
  }
}
