import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ten_twenty_asgn/data/response/MovieDetailResponse.dart';
import 'package:ten_twenty_asgn/data/repositories/repository.dart';
import 'package:ten_twenty_asgn/data/response/MovieVideosResponse.dart';

part 'moviedetail_event.dart';

part 'moviedetail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final Repository repository;

  MovieDetailBloc({required this.repository}) : super(DashboardLoading()) {
    on<Initialize>((event, emit) async {
      emit(Initial());
    });

    on<LoadMovieDetailEvent>((event, emit) async {
      MovieDetailResponse? response = MovieDetailResponse();

      if (await InternetConnectionChecker.instance.hasConnection) {
        response = await repository.getMovieDetail(event.movieId);
        if (response != null) {
          emit(MoviesDetailLoadedState(response));
        }
      }
      //emit(Initial());
    });

    on<LoadMovieVideosEvent>((event, emit) async {
      MovieVideosResponse? response = MovieVideosResponse();

      if (await InternetConnectionChecker.instance.hasConnection) {
        response = await repository.getMovieVideos(event.movieId);
        if (response != null) {
          String? k = response.results!
              .firstWhere((element) => element.type == "Trailer")
              .key;
          emit(MoviesVideosLoadedState(response));
        }
      }
    });
  }
}
