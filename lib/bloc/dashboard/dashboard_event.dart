part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class Initialize extends DashboardEvent {}

class LoadUpcommingMoviesEvent extends DashboardEvent {
  LoadUpcommingMoviesEvent();
}

class SearchButtonClickEvent extends DashboardEvent {
  SearchButtonClickEvent();
}

class SearchMoviesEvent extends DashboardEvent {
  String query;

  SearchMoviesEvent(this.query);
}
class GetGenreMoviesEvent extends DashboardEvent {
  int genId;

  GetGenreMoviesEvent(this.genId);
}
