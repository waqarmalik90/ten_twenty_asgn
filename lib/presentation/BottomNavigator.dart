import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/presentation/dashboard/Dashboard.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_subtitle.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/custom_app_bar.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() =>
      _BottomNavigatorState();
}

class _BottomNavigatorState extends State {
  int _selectedTab = 1;

  List _pages = [
    const Center(
      child: Text("Dashboard"),
    ),
    Dashboard(),
    /*const Center(
      child: Text("Watch"),
    ),*/
    const Center(
      child: Text("Media Library"),
    ),
    const Center(
      child: Text("More"),
    ),

  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      /*appBar: CustomAppBar(
          height: 36.v,
          title: AppbarSubtitle(
              text: "Watch", margin: EdgeInsets.only(left: 22.h)),
          actions: [
            AppbarTrailingImage(
                imagePath: ImageConstant.imgSearch,
                margin: EdgeInsets.symmetric(horizontal: 13.h),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchMovies(),
                      ));

                  //onTapSearch(context);
                })
          ]),*/
      body:  _pages[_selectedTab],
      bottomNavigationBar: Container(
        height: 75.v,
        decoration: BoxDecoration(
          color: appTheme.blueGray900,
          borderRadius: BorderRadius.circular(
            27.h,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_dashboard.svg",
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      color: appTheme.whiteA700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        "Dashboard",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_dashboard.svg",
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      color: appTheme.gray600,
                    ),
                    Opacity(
                      opacity: 0.54,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.v),
                        child: Text(
                          "Dashboard",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.whiteA700.withOpacity(0.55),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_watch.svg",
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      color: appTheme.whiteA700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        "Watch",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_watch.svg",
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      color: appTheme.gray600,
                    ),
                    Opacity(
                      opacity: 0.54,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.v),
                        child: Text(
                          "Watch",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.whiteA700.withOpacity(0.55),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_media_library.svg",
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      color: appTheme.whiteA700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        "Media Library",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_media_library.svg",
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      color: appTheme.gray600,
                    ),
                    Opacity(
                      opacity: 0.54,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.v),
                        child: Text(
                          "Media Library",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.whiteA700.withOpacity(0.55),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_more.svg",
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      color: appTheme.whiteA700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        "More",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_nav_more.svg",
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                      color: appTheme.gray600,
                    ),
                    Opacity(
                      opacity: 0.54,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.v),
                        child: Text(
                          "More",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.whiteA700.withOpacity(0.55),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: ""),



            /*BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3_outlined), label: "Product"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: "Contact"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),*/
          ],
        ),
      ),
    );
  }
}
