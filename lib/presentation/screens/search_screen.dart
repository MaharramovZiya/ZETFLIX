import 'package:flutter/material.dart';
import 'package:movies_api_bloc/presentation/widgets/search/search_bar_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/search/search_list_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(11),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [SearchListsWidget()],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
