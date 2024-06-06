import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api_bloc/bloc/movie_bloc.dart';
import 'package:movies_api_bloc/constant/api/api_keys.dart';
import 'package:movies_api_bloc/presentation/screens/detail_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is MovieTrendingSuccess) {
          final movies = state.movieModel.results ?? [];
          // final movies = state.movieList;
          return SizedBox(
            height: 400,
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: movies.length,
              options: CarouselOptions(
                height: 450,
                autoPlay: true,
                viewportFraction: 1,
                pageSnapping: true,
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) {
                final movie = movies[itemIndex];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movieId: movie.id!, movie: movie),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 450,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        scale: 2,
                        "${APIConstants.image_key}${movie.posterPath}"),
                  ),
                );
              },
            ),
          );
        } else if (state is MovieFailure) {
          return Center(
            child: Text("Error: ${state.error}"),
          );
        } else {
          return const Center(
            child: Text("Error..."),
          );
        }
      },
    );
  }
}
