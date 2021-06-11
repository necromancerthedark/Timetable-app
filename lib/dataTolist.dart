import 'dart:convert';
import 'package:flutter/material.dart';
import 'classLink.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class dataToList extends StatefulWidget {
  String URL;
  dataToList(String URL) {
    this.URL = URL;
  }

  @override
  _dataToListState createState() => _dataToListState();
}

class _dataToListState extends State<dataToList> {
  Future<ClassLinks> classData;

  Future<ClassLinks> fetchLinks() async {
    final response = await http.get(Uri.parse(widget.URL));
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
    return RefreshIndicator(
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
                Text("Making Chai☕...."),
                Container(
                  height: 20.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
