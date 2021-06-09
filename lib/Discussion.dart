import 'package:flutter/material.dart';
import 'package:timetable/profileUpperBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  _launchURL() async {
    const url = 'https://wa.me/919889526817';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLGit() async {
    const url = 'https://www.github.com/necromancerthedark';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLinsta() async {
    const url = 'https://instagram.com/thatsartisting';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => themeProvider(),
        builder: (context, _) {
          final themeprovider = Provider.of<themeProvider>(context);
          return MaterialApp(
            theme: MyTheme.lightMode,
            darkTheme: MyTheme.darkMode,
            themeMode: themeprovider.themeMode,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: profileUpperBar(),
              body: Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 40.0, 20.0, 20.0),
                            child: GestureDetector(
                              child: ClipOval(
                                child: Image.asset(
                                  "asset/kgp.jpg",
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: SizedBox(
                              child: Text(
                                "Kumar Gaurav Pandey",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: _launchURL,
                                    child: Image.asset(
                                      "asset/whatsapp.png",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: _launchURLGit,
                                    child: ClipOval(
                                      child: Image.asset(
                                        "asset/github-logo.png",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: _launchURLinsta,
                                    child: Image.asset(
                                      "asset/instagram.png",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "An Artist",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.lerp(
                                  FontWeight.w200, FontWeight.w300, 2),
                            ),
                          ),
                          Text(
                            "A Coder",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontWeight: FontWeight.lerp(
                                  FontWeight.w200, FontWeight.w300, 2),
                            ),
                          ),
                          Text(
                            "A Student",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontWeight: FontWeight.lerp(
                                  FontWeight.w200, FontWeight.w300, 2),
                            ),
                          ),
                          Text(
                            "An Android Developer",
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              fontWeight: FontWeight.lerp(
                                  FontWeight.w200, FontWeight.w300, 2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Linux Enthusiast",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.lerp(
                                    FontWeight.w200, FontWeight.w300, 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      //offset: Offset(1, 0.5),
                      color: Color(0x121212),
                      blurRadius: 12.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.grey.shade900,
            ),
          );
        },
      );
}
