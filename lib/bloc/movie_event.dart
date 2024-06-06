part of 'movie_bloc.dart';

abstract class MovieEvent  {}


//Trending Movies event
class FetchTrendingMovieData extends MovieEvent {
  
}

// Upcoming / Soon movies Event
class FetchUpComingMovies extends MovieEvent {
  
}

//Popular Movie event
class FetchPopularMovieEvent extends MovieEvent {}

//Top rated Event
class FetchTopRatedEvent extends MovieEvent {}


//Fetch trailer

class FetchMovieTrailer extends MovieEvent{
    final int movieId;

   FetchMovieTrailer(this.movieId);

  List<Object> get props => [movieId];
}