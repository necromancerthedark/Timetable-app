import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        centerTitle: true,
        title: Text(
          "Class Links",
          style: GoogleFonts.caveat(
            textStyle: TextStyle(color: Colors.black87),
            fontSize: 40.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
