
import 'package:flutter/material.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';
import 'package:movies_api_bloc/presentation/screens/detail_screen.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.widget,
  });

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colours.ratingColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Rating: ${widget.movie.voteAverage}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
