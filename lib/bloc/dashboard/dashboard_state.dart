part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class Initial extends DashboardState {
  Initial();
}

class DashboardLoading extends DashboardState {}

class MoviesListLoadedState extends DashboardState {
  List<UpComingMovieResult>? lstUpcpmingMovies;
  MoviesListLoadedState(this.lstUpcpmingMovies);
}

class MoviesSearchedState extends DashboardState {
  List<UpComingMovieResult>? lstUpcpmingMovies;
  MoviesSearchedState(this.lstUpcpmingMovies);
}

class FeederNotSelected extends DashboardState {
  String msg;
  FeederNotSelected(this.msg);
}

class DashboardError extends DashboardState {
  String error;
  DashboardError(this.error);
}

class SearchbuttonClickedState extends DashboardState {
  List<Genres>? lstGenres;
  SearchbuttonClickedState(this.lstGenres);

}
