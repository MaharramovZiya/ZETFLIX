
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api_bloc/bloc/movie_bloc.dart';
import 'package:movies_api_bloc/constant/api/api_keys.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';
import 'package:movies_api_bloc/presentation/screens/detail_screen.dart';

class ComingSoonCardWidget extends StatelessWidget {
  const ComingSoonCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is MovieUpcomingSuccess) {
          final movies = state.movieModel.results ?? [];
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: movies.length,
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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: 140,
                      color: Colours.darkGray,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 140,
                            child: Image.network(
                              '${APIConstants.image_key}${movie.posterPath}',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${movie.title}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colours.ratingColor,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${movie.voteAverage}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Original language: ${movie.originalLanguage}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "Date: ${movie.releaseDate}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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