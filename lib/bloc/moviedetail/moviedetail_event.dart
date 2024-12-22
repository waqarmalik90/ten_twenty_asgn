part of 'moviedetail_bloc.dart';

abstract class MovieDetailEvent {

}
class Initialize extends MovieDetailEvent{}
class LoadMovieDetailEvent extends MovieDetailEvent{
  int movieId;
  LoadMovieDetailEvent(this.movieId);
}
class LoadMovieVideosEvent extends MovieDetailEvent{
  int movieId;
  LoadMovieVideosEvent(this.movieId);
}