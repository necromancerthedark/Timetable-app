import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'Discussion.dart';
import 'changtheme.dart';

class Upperbar extends StatefulWidget with PreferredSizeWidget {
  @override
  _UpperbarState createState() => _UpperbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _UpperbarState extends State<Upperbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        actions: [
          changeTheme(),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.topLeft,
                    child: Discussion()));
          },
          child: Icon(Icons.developer_mode_rounded),
        ),
        centerTitle: true,
        title: Text(
          "Class Links",
          style: GoogleFonts.caveat(
            // textStyle: themeprovider.isDarkMode
            //     ? TextStyle(color: Colors.white)
            //     : TextStyle(color: Colors.black87),
            fontSize: 40.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
