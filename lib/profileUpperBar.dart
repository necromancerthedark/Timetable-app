import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profileUpperBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _UpperbarState createState() => _UpperbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _UpperbarState extends State<profileUpperBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        centerTitle: true,
        title: Text(
          "About Me",
          style: GoogleFonts.caveat(
            fontSize: 40.0,
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
      ),
    );
  }
}
