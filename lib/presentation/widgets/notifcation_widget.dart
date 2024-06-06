
import 'package:flutter/material.dart';
import 'package:movies_api_bloc/presentation/widgets/text_widget.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.notifications),
          TextWidget(text: "Notifications")
        ],
      ),
    );
  }
}
