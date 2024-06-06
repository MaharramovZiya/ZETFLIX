import 'package:flutter/material.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent(
      {super.key, required this.onTap, required this.currentIndex});
  final Function(int) onTap;
  final int currentIndex;

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: "Coming Soon",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: "Menu"),
        ],
        currentIndex: widget.currentIndex,
        selectedItemColor: Colours.lightGray,
        unselectedItemColor: Colors.red,
        onTap: widget.onTap,
      ),
    );
  }
}
