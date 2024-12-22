import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ten_twenty_asgn/data/model/GenresResponse.dart';
import 'package:ten_twenty_asgn/data/model/UpcomingMovieResult.dart';
import 'package:ten_twenty_asgn/data/repositories/repository.dart';
import 'package:ten_twenty_asgn/data/response/UpComingMoviesResponse.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Repository repository;

  DashboardBloc({required this.repository}) : super(DashboardLoading()) {
    on<Initialize>((event, emit) async {
      emit(Initial());
    });

    on<LoadUpcommingMoviesEvent>((event, emit) async {
      UpComingMoviesResponse? response = UpComingMoviesResponse();
      if (await InternetConnectionChecker.instance.hasConnection) {
        response = await repository.getUpcomingMovies();
        if (response != null && response.results != null) {
          emit(MoviesListLoadedState(response.results));
        }
      }
      //emit(Initial());
    });

    on<SearchMoviesEvent>((event, emit) async {
      UpComingMoviesResponse? response = UpComingMoviesResponse();
      if (await InternetConnectionChecker.instance.hasConnection) {
        response = await repository.searchMovies(event.query);
        if (response != null && response.results != null) {
          emit(MoviesSearchedState(response.results));
        }
      }
      //emit(Initial());
    });

    on<SearchButtonClickEvent>((event, emit) async {
      GenresResponse? response = GenresResponse();
      if (await InternetConnectionChecker.instance.hasConnection) {
        response = await repository.getGenres();
        if (response != null && response.genres != null) {
          emit(SearchbuttonClickedState(response.genres));
        }
        else{
          emit(SearchbuttonClickedState([]));
        }
      }
      //emit(SearchbuttonClickedState());
    });

    on<GetGenreMoviesEvent>((event, emit) async {
      UpComingMoviesResponse? response = UpComingMoviesResponse();
      if (await InternetConnectionChecker.instance.hasConnection) {
        response = await repository.getGenresMoviesList(event.genId);
        if (response != null && response.results != null) {
          emit(MoviesSearchedState(response.results));
        }
      }
      //emit(Initial());
    });

  }
}
