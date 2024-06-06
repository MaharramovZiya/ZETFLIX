import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api_bloc/bloc/movie_bloc.dart';
import 'package:movies_api_bloc/models/movie_model.dart';
import 'package:movies_api_bloc/presentation/widgets/detail_screen/rating_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {
  final Results movie;
  final int movieId;

  const DetailScreen({super.key, required this.movie, required this.movieId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    context.read<MovieTrailerBloc>().add(FetchMovieTrailer(widget.movieId));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(),
              BlocBuilder<MovieTrailerBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is MovieTrailerSuccess) {
                    final video = state.video;
                    final videoId = video.key;
                    _controller = YoutubePlayerController(
                        initialVideoId: videoId,
                        flags: const YoutubePlayerFlags(autoPlay: false));
                    return YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        ProgressBar(
                          isExpanded: true,
                          colors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent,
                          ),
                        ),
                        const PlaybackSpeedButton(),
                        FullScreenButton(),
                      ],
                    );
                  } else if (state is MovieFailure) {
                    return Center(
                      child: Text("Error: ${state.error}"),
                    );
                  } else {
                    return const Text("No video available");
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(16.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      widget.movie.title ?? 'No title',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RatingWidget(widget: widget),
                    const SizedBox(height: 8),
                    Text(
                      'Release Date: ${widget.movie.releaseDate}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Language: ${widget.movie.originalLanguage}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.movie.overview ?? 'No description available',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
