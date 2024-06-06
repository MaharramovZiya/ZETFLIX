
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api_bloc/bloc/movie_bloc.dart';
import 'package:movies_api_bloc/constant/api/api_keys.dart';
import 'package:movies_api_bloc/presentation/screens/detail_screen.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({
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
        } else if (state is MovieFailure) {
          return Center(
            child: Text("Error: ${state.error}"),
          );
        } else if (state is MovieTrendingSuccess) {
          final movies = state.movieModel.results ?? [];
          // final movies = state.movieList;

          return SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: movies.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return InkWell(
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movieId: movie.id!,
                        movie: movie),
                    ),
                  );
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 150,
                          height: 200,
                          child: Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fitWidth,
                              '${APIConstants.image_key}${movie.posterPath}'),
                        )),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}