import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api_bloc/models/movie_model.dart';
import 'package:movies_api_bloc/data/repository/movie_repository.dart';
import 'package:movies_api_bloc/models/video_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

//This bloc is used to show Trending movies.
class TrendingMovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  TrendingMovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchTrendingMovieData>(_onGetTrendingMovies);
  }

  Future<void> _onGetTrendingMovies(
      FetchTrendingMovieData event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movie = await movieRepository.fetchTrendingMovies();
      emit(MovieTrendingSuccess(movieModel: movie));
    } catch (e) {
      emit(MovieFailure(error: 'Error: ${e.toString()}'));
    }
  }
}

//This bloc is used to show Soon/Up Coming  movies.
class UpcomingMovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  UpcomingMovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchUpComingMovies>(_onGetUpComingMovies);
  }

  Future<void> _onGetUpComingMovies(
      FetchUpComingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movie = await movieRepository.fetchUpcomingMovies();
      emit(MovieUpcomingSuccess(movieModel: movie));
    } catch (e) {
      emit(MovieFailure(error: 'Error: ${e.toString()}'));
    }
  }
}

//This bloc is used to show popular movies.

class PopularMovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  PopularMovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchPopularMovieEvent>(_onGetPopularMovies);
  }

  Future<void> _onGetPopularMovies(
      FetchPopularMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movie = await movieRepository.fetchPopularMovies();
      emit(MoviePopularSuccess(movieModel: movie));
    } catch (e) {
      emit(MovieFailure(error: 'Error: ${e.toString()}'));
    }
  }
}
//This bloc is used to show Top Rated movies.

class TopRatedMovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  TopRatedMovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchTopRatedEvent>(_onGetTopRatedMovies);
  }

  Future<void> _onGetTopRatedMovies(
      FetchTopRatedEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movie = await movieRepository.fetchTopRatedMovies();
      emit(MovieTopRatedSuccess(movieModel: movie));
    } catch (e) {
      emit(MovieFailure(error: 'Error: ${e.toString()}'));
    }
  }
}

//This bloc is used to show the trailer of the movie.

class MovieTrailerBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieTrailerBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchMovieTrailer>(_onGetMovieTrailer);
  }

  Future<void> _onGetMovieTrailer(
      FetchMovieTrailer event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movieTrailer =
          await movieRepository.fetchMovieTrailer(event.movieId);
      if (movieTrailer != null) {
        emit(MovieTrailerSuccess(movieTrailer));
      } else {
        emit(MovieFailure(error: "Trailer not found"));
      }
    } catch (e) {
      emit(MovieFailure(error: e.toString()));
    }
  }
}
