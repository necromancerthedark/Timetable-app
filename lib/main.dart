import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:timetable/timeTable.dart';
import 'classLink.dart';
import 'UpperBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            title: "Class Links",
            home: homePage(),
          );
        },
      );
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future<ClassLinks> classData;

  Future<ClassLinks> fetchLinks() async {
    final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/necromancerthedark/TT_Json/main/class_link.json"));
    if (response.statusCode == 200) {
      return ClassLinks.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch");
    }
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Error!");
    }
  }

  @override
  void initState() {
    super.initState();
    classData = fetchLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Upperbar(),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              fetchLinks();
            });
          });
        },
        child: FutureBuilder<ClassLinks>(
          future: classData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.totalClass,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10.0,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Color(0x450DDBC8),
                        width: 1.0,
                      ),
                      //borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data.classList[index].profilePic),
                      ),
                      title: Text(
                        snapshot.data.classList[index].name,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      subtitle: Text(snapshot.data.classList[index].code),
                      onTap: () {
                        launchURL(snapshot.data.classList[index].link);
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Uh oh! Internet Please >_< "),
                  ],
                ),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Brewing Coffee...."),
                  Container(
                    height: 20.0,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Text(
        "Made with ♥ by Kumar Gaurav in Flutter",
        textAlign: TextAlign.center,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.bottomRight,
                  child: timeTable()));
        },
        child: Icon(Icons.alarm),
      ),
    );
  }
}
