import 'package:flutter/material.dart';
import 'package:movies_api_bloc/presentation/widgets/coming_soon/coming_soon_card_widget.dart';
import 'package:movies_api_bloc/presentation/widgets/notifcation_widget.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding:  EdgeInsets.all(11),
          physics:  BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationWidget(),
              Padding(
                padding:  EdgeInsets.all(10),
                child: Column(
                  children: [
                    ComingSoonCardWidget()
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

