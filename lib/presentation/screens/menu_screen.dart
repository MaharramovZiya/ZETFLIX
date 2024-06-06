import 'package:flutter/material.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';
import 'package:movies_api_bloc/models/profile_model.dart';
import 'package:movies_api_bloc/presentation/widgets/text_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.00),
        child: Column(
          children: [
            const ProfilesWidget(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.edit), Text("Manage Profiles")],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colours.darkGray,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.message_sharp),
                      TextWidget(
                        text: "Tell friends about ZETFLIX",
                      )
                    ],
                  ),
                  Text("Lorem ipsum" * 7),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('Terms&Conditions'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: const Text(
                  "Copy Link",
                  style: TextStyle(color: Colours.darkGray),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.facebook,
                  size: 50,
                ),
                Icon(
                  Icons.telegram,
                  size: 50,
                ),
                Icon(
                  Icons.add_to_drive_outlined,
                  size: 50,
                ),
                Icon(
                  Icons.wordpress,
                  size: 50,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  size: 45,
                ),
                TextWidget(text: "My List")
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "App Settings"),
                  TextWidget(text: "Account"),
                  TextWidget(text: "Help"),
                  TextWidget(text: "Sign out")
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ProfilesWidget extends StatelessWidget {
  const ProfilesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: profilList.length,
        itemBuilder: (context, index) {
          final profilIndex = profilList[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(profilIndex.img),
                    Text(profilIndex.name)
                  ],
                )),
          );
        },
      ),
    );
  }
}
