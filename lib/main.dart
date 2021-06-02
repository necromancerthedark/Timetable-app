import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'classLink.dart';
import 'UpperBar.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Class Links",
      home: homePage(),
    );
  }
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
      body: FutureBuilder<ClassLinks>(
        future: classData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.totalClass,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data.classList[index].profilePic),
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
                );
              },
              physics: const AlwaysScrollableScrollPhysics(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Net On Karle Bhai Please!"),
                ],
              ),
            );
          }

          // By default, show a loading spinner.
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Itni Kya Jaldi Hai Class Karne ki?"),
                Container(
                  height: 20.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Text(
        "Made with ♥ by Kumar Gaurav in Flutter",
        textAlign: TextAlign.center,
      ),
    );
  }
}
