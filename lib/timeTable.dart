import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/UpperBar.dart';

class timeTable extends StatefulWidget {
  @override
  _timeTableState createState() => _timeTableState();
}

class _timeTableState extends State<timeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Upperbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  "CS -61",
                  style: GoogleFonts.caveat(fontSize: 20.0),
                ),
              ),
              Image.asset("asset/61.png"),
              Container(
                child: Text(
                  "CS -62",
                  style: GoogleFonts.caveat(fontSize: 20.0),
                ),
              ),
              Image.asset("asset/62.png"),
              Container(
                child: Text(
                  "CS -63",
                  style: GoogleFonts.caveat(fontSize: 20.0),
                ),
              ),
              Image.asset("asset/63.png"),
              Container(
                child: Text(
                  "CS -64",
                  style: GoogleFonts.caveat(fontSize: 20.0),
                ),
              ),
              Image.asset("asset/64.png"),
              Container(
                child: Text(
                  "Quiz Cycle",
                  style: GoogleFonts.caveat(fontSize: 20.0),
                ),
              ),
              Image.asset("asset/quiz.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
