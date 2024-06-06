import 'package:flutter/material.dart';
import 'package:movies_api_bloc/components/app_strings.dart';
import 'package:movies_api_bloc/presentation/widgets/chooise_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/custom_app_bar.dart';
import 'package:movies_api_bloc/presentation/widgets/popular_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/preview_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/text_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/toprated_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/trending_slider_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/trending_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrendingSlider(),
                  SizedBox(
                    height: 25,
                  ),
                  ChooiseWidget(),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: TextWidget(text: AppStrings.previewsTxt)),
                  PreviewWidget(),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: TextWidget(
                        text: AppStrings.popularTxt,
                      )),
                  PopularMoviesWidget(),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: TextWidget(text: AppStrings.trendingTxt)),
                  TrendingWidget(),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: TextWidget(text: AppStrings.topRatedTxt)),
                  TopratedWidget()
                ],
              ),
            ),
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}

