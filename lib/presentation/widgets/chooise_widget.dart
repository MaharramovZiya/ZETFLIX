
import 'package:flutter/material.dart';
import 'package:movies_api_bloc/components/app_strings.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';

class ChooiseWidget extends StatelessWidget {
  const ChooiseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colours.lightGray,
            )),
        Container(
          width: 130,
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colours.lightGray, borderRadius: BorderRadius.circular(5)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.play_arrow,
                color: Colours.darkGray,
                size: 40,
              ),
              Text(
                AppStrings.playButtonTxt,
                style: TextStyle(
                    fontSize: 20,
                    color: Colours.darkGray,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: Colours.lightGray,
            )),
      ],
    );
  }
}