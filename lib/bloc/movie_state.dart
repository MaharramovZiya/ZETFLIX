part of 'movie_bloc.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieTrendingSuccess extends MovieState {
  final Movie movieModel;
  MovieTrendingSuccess({required this.movieModel});
}

class MovieUpcomingSuccess extends MovieState {
  final Movie movieModel;
  MovieUpcomingSuccess({required this.movieModel});
}

class MoviePopularSuccess extends MovieState {
  final Movie movieModel;
  MoviePopularSuccess({required this.movieModel});
}

class MovieTopRatedSuccess extends MovieState {
  final Movie movieModel;
  MovieTopRatedSuccess({required this.movieModel});
}

class MovieTrailerSuccess extends MovieState {
 final Video video;

   MovieTrailerSuccess(this.video);

  List<Object> get props => [video];
}

class MovieFailure extends MovieState {
  final String error;
  MovieFailure({required this.error});
}
