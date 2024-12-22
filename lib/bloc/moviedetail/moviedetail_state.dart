part  of 'moviedetail_bloc.dart';

abstract class MovieDetailState{

}

class Initial extends MovieDetailState{
  Initial();
}
class DashboardLoading extends MovieDetailState{}

class MoviesDetailLoadedState extends MovieDetailState{
  MovieDetailResponse? movieDetailResponse;
  MoviesDetailLoadedState(this.movieDetailResponse);
}
class MoviesVideosLoadedState extends MovieDetailState{
  MovieVideosResponse? movieVideosResponse;
  MoviesVideosLoadedState(this.movieVideosResponse);
}

class DashboardError extends MovieDetailState{
  String error;
  DashboardError(this.error);
}