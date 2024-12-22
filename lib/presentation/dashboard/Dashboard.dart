import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/bloc/dashboard/dashboard_bloc.dart';
import 'package:ten_twenty_asgn/data/model/GenresResponse.dart';
import 'package:ten_twenty_asgn/data/model/UpcomingMovieResult.dart';
import 'package:ten_twenty_asgn/data/repositories/repository.dart';
import 'package:ten_twenty_asgn/presentation/Theme/app_decoration.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_text_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/presentation/moviedetail/MovieDetail.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_subtitle.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/custom_app_bar.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';
import 'package:ten_twenty_asgn/widgets/custom_text_form_field.dart';
import 'package:ten_twenty_asgn/widgets/four_item_widget.dart';
import 'package:ten_twenty_asgn/widgets/two_item_widget.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late DashboardBloc _dashboardBloc;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _dashboardBloc = DashboardBloc(repository: Repository());
    _dashboardBloc.add(LoadUpcommingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RepositoryProvider(
      create: (context) => Repository(),
      child: BlocProvider(
      create: (context) => _dashboardBloc,
      child:
      BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is Initial) {}
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is Initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviesListLoadedState) {
              return _buildMovieList(context, state.lstUpcpmingMovies ?? []);
            }
            if (state is SearchbuttonClickedState) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildTwentyTwo(context),
                    SizedBox(height: 30.v),
                    _buildTwo(context, state.lstGenres),
                  ],
                ),
              );
            }

            if (state is MoviesSearchedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTwentyTwo(context),
                    SizedBox(height: 30.v),
                    _buildFour(context, state.lstUpcpmingMovies ?? []),
                  ],
                ),
              );
            }

            if (state is DashboardLoading) {
              BlocProvider.of<DashboardBloc>(context).add(Initialize());
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    ) );
  }
  Widget _buildMovieList(BuildContext context, List<UpComingMovieResult>? lstUpcpmingMovies) {

    return Scaffold(
      appBar: CustomAppBar(
          height: 36.v,
          title: AppbarSubtitle(
              text: "Watch", margin: EdgeInsets.only(left: 22.h)),
          actions: [
            AppbarTrailingImage(
                imagePath: ImageConstant.imgSearch,
                margin: EdgeInsets.symmetric(horizontal: 13.h),
                onTap: () {

                  BlocProvider.of<DashboardBloc>(context)
                      .add(SearchButtonClickEvent());

                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchMovies(),
                      ));*/

                  //onTapSearch(context);
                })
          ]),
      body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: lstUpcpmingMovies!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 180.v,
                      width: 335.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: "${Repository.imageUrl}${lstUpcpmingMovies[index].backdropPath}",
                            height: 180.v,
                            width: 335.h,
                            radius: BorderRadius.circular(
                              10.h,
                            ),
                            alignment: Alignment.center,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetail(movieId: lstUpcpmingMovies[index].id ?? 0,),
                                  ));
                              //onTapImgFreeGuy!.call();
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 335.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.h,
                                vertical: 15.v,
                              ),
                              decoration:
                              AppDecoration.gradientErrorContainerToErrorContainer.copyWith(
                                borderRadius: BorderRadiusStyle.customBorderBL10,
                              ),
                              child: Text(
                                lstUpcpmingMovies[index].originalTitle ?? "",
                                style: CustomTextStyles.titleMediumWhiteA70018,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),


    );
  }

  Widget _buildTwentyTwo(BuildContext context) {
    //TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.v),
          CustomTextFormField(
            onChanged: (text) {
              BlocProvider.of<DashboardBloc>(context)
                  .add(SearchMoviesEvent(text));
            },
            controller: searchController,
            hintText: "TV shows, movies and more",
            hintStyle: CustomTextStyles.bodyMediumPrimaryContainer,
            textInputAction: TextInputAction.done,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(10.h, 8.v, 2.h, 8.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 36.adaptSize,
                width: 36.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 52.v,
            ),
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 10.v, 11.h, 12.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgIconClose,
                height: 30.adaptSize,
                width: 30.adaptSize,
                onTap: (){
                  BlocProvider.of<DashboardBloc>(context)
                      .add(LoadUpcommingMoviesEvent());
                },
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 52.v,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTwo(BuildContext context, List<Genres>? lstgenres) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 101.v,
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: lstgenres?.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                BlocProvider.of<DashboardBloc>(context)
                    .add(GetGenreMoviesEvent(lstgenres?[index].id ?? 0));
              },
                child: TwoItemWidget(genres: lstgenres?[index]));
          },
        ),
      ),
    );
  }

  Widget _buildFour(BuildContext context, List<UpComingMovieResult>? lstUpcpmingMovies) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 14.v);
        },
        itemCount: lstUpcpmingMovies!.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CustomImageView(
              imagePath: "${Repository.imageUrl}${lstUpcpmingMovies[index].backdropPath}",
              height: 100.v,
              width: 130.h,
              radius: BorderRadius.circular(
                10.h,
              ),
              margin: EdgeInsets.only(top: 1.v),
            ),
            title: Text(lstUpcpmingMovies[index].originalTitle!),
            //subtitle: Text("This is subtitle"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup19625114,
                    height: 4.v,
                    width: 20.h,
                    margin: EdgeInsets.only(top: 21.v),
                  ),
                  //Icon(Icons.flight_land)
                ]),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetail(movieId: lstUpcpmingMovies[index].id ?? 0,),
                  ));
            },
          );
            _buildSearchList(context, lstUpcpmingMovies[index]);
        });
  }

  Widget _buildSearchList(
      BuildContext context, UpComingMovieResult searchMovie) {
    return

      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.h,
          vertical: 3.v,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: "${Repository.imageUrl}${searchMovie.backdropPath}",
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
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Expanded(
                              child: Text(
                                searchMovie.originalTitle ?? "",
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup19625114,
                            height: 4.v,
                            width: 20.h,
                            margin: EdgeInsets.only(top: 21.v),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    "",
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
