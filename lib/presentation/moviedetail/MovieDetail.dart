import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ten_twenty_asgn/Utils/image_constant.dart';
import 'package:ten_twenty_asgn/Utils/size_utils.dart';
import 'package:ten_twenty_asgn/bloc/moviedetail/moviedetail_bloc.dart';
import 'package:ten_twenty_asgn/data/repositories/repository.dart';
import 'package:ten_twenty_asgn/data/response/MovieDetailResponse.dart';
import 'package:ten_twenty_asgn/data/response/MovieVideosResponse.dart';
import 'package:ten_twenty_asgn/presentation/Theme/app_decoration.dart';
import 'package:ten_twenty_asgn/presentation/Theme/custom_text_style.dart';
import 'package:ten_twenty_asgn/presentation/Theme/theme_helper.dart';
import 'package:ten_twenty_asgn/presentation/seatmapping/SeatMapping.dart';
import 'package:ten_twenty_asgn/widgets/CustomColors.dart';
import 'package:ten_twenty_asgn/widgets/VideoPlayWidget.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_leading_image.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/appbar_title.dart';
import 'package:ten_twenty_asgn/widgets/app_bar/custom_app_bar.dart';
import 'package:ten_twenty_asgn/widgets/custom_elevated_button.dart';
import 'package:ten_twenty_asgn/widgets/custom_image_view.dart';
import 'package:ten_twenty_asgn/widgets/custom_outlined_button.dart';
import 'package:ten_twenty_asgn/widgets/frame_item_widget.dart';


class MovieDetail extends StatefulWidget {
  final int movieId;

  MovieDetail({required this.movieId});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late MovieDetailBloc _movieDetailBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = MovieDetailBloc(repository: Repository());
    //_movieDetailBloc.add(LoadMovieDetailEvent(widget.movieId));
    _movieDetailBloc.add(LoadMovieVideosEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String videoid = "";

    MovieVideosResponse? response = MovieVideosResponse();
    return RepositoryProvider(
        create: (context) => Repository(),
        child: BlocProvider(
          create: (context) => _movieDetailBloc,
          child: BlocListener<MovieDetailBloc, MovieDetailState>(
            listener: (context, state) {
              if (state is DashboardError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }

              if (state is MoviesDetailLoadedState) {
                /*BlocProvider.of<MovieDetailBloc>(context)
                    .add(LoadMovieVideosEvent(widget.movieId));*/
              }
              if (state is MoviesVideosLoadedState) {
                videoid = state.movieVideosResponse!.results!.firstWhere((element) => element.site == "YouTube").key ?? "";

                BlocProvider.of<MovieDetailBloc>(context)
                    .add(LoadMovieDetailEvent(widget.movieId));
              }

              if (state is Initial) {}
            },
            child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
              builder: (context, state) {
                if (state is Initial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is MoviesDetailLoadedState) {
                  return SafeArea(
                      child: Scaffold(
                          backgroundColor: appTheme.whiteA700,
                          body: SingleChildScrollView(
                            child: SizedBox(
                                width: double.maxFinite,
                                child: Column(children: [
                                  SizedBox(
                                      height: 422.v,
                                      width: double.maxFinite,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    "${Repository.imageUrl}${state.movieDetailResponse!.backdropPath}",
                                                height: 422.v,
                                                width: 375.h,
                                                fit: BoxFit.fitHeight,
                                                alignment: Alignment.center),
                                            Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                    height: 422.v,
                                                    width: double.maxFinite,
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        children: [
                                                          _buildSixteen(
                                                              context,
                                                              state
                                                                  .movieDetailResponse, videoid),
                                                          _buildFifteen(
                                                              context,
                                                              state
                                                                  .movieDetailResponse)
                                                        ])))
                                          ])),
                                  _buildGenres(context, state.movieDetailResponse)
                                ])),
                          )));
                }
                if (state is DashboardLoading) {
                  BlocProvider.of<MovieDetailBloc>(context).add(Initialize());
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ),
        ));
  }

  Widget _buildSixteen(
      BuildContext context, MovieDetailResponse? movieDetailResponse, String videoId) {
    DateTime? dateTime = DateTime.tryParse(movieDetailResponse!.releaseDate!);
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 66.h, vertical: 34.v),
            decoration: AppDecoration.gradientErrorContainerToErrorContainer1,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //SizedBox(height: 30.v),
                  /*CustomImageView(
                      imagePath: "${Repository.imageUrl}${movieDetailResponse!.backdropPath}",
                      height: 30.v,
                      width: 102.h),*/
                  //SizedBox(height: 5.v),
                  Text(movieDetailResponse?.title ?? "", style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),),

                  Text(
                      "In theaters ${DateFormat('MMMM dd, yyyy').format(dateTime!)}",
                      style: CustomTextStyles.titleMediumWhiteA700),
                  SizedBox(height: 11.v),
                  CustomElevatedButton(
                      text: "Get Tickets",
                      buttonStyle: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            CustomColors.GetTicketsColor),
                        elevation: WidgetStateProperty.all<double>(0),
                      ),
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeatMapping(movieName: movieDetailResponse.title, inDate: DateFormat('MMMM dd, yyyy').format(dateTime!)),
                            ));

                        //onTapGetTickets(context);
                      }),
                  SizedBox(height: 10.v),
                  CustomOutlinedButton(text: "Watch Trailer", onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayWidget(videoID: videoId),
                        ));
                  },)
                ])));
  }

  /// Section Widget
  Widget _buildFifteen(
      BuildContext context, MovieDetailResponse? movieDetailResponse) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.v),
            //decoration: AppDecoration.gradientErrorContainerToErrorContainer1,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              //SizedBox(height: 60.v),
              CustomAppBar(
                  leadingWidth: 43.h,
                  leading: AppbarLeadingImage(
                    onTap: () { Navigator.pop(context); } ,
                      imagePath: ImageConstant.imgIconUpWhiteA700,
                      margin: EdgeInsets.only(left: 13.h)),
                  title: AppbarTitle(
                      text: "Watch", margin: EdgeInsets.only(left: 15.h))
              )
            ])));
  }

  /// Section Widget
  Widget _buildGenres(
      BuildContext context, MovieDetailResponse? movieDetailResponse) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 25.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Genres", style: theme.textTheme.titleMedium),
          SizedBox(height: 11.v),
          Wrap(
              runSpacing: 5.v,
              spacing: 5.h,
              children: List<Widget>.generate(
                  movieDetailResponse!.genres!.length,
                  (index) => FrameItemWidget(
                      genreName: movieDetailResponse.genres![index].name!))),
          SizedBox(height: 22.v),
          Opacity(opacity: 0.05, child: Divider()),
          SizedBox(height: 11.v),
          Text("Overview", style: theme.textTheme.titleMedium),
          SizedBox(height: 12.v),
          SizedBox(
              width: 294.h,
              child: Text(movieDetailResponse!.overview ?? "",
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodySmallPoppinsGray50001
                      .copyWith(height: 1.60))),
          SizedBox(height: 5.v)
        ]));
  }
}
