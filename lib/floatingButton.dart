import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'timeTable.dart';

class floatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.scale,
                alignment: Alignment.bottomRight,
                child: timeTable()));
      },
      child: Icon(Icons.alarm),
    );
  }
}
