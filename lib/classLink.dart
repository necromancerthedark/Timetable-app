// To parse this JSON data, do
//
//     final classLinks = classLinksFromJson(jsonString);

import 'dart:convert';

ClassLinks classLinksFromJson(String str) =>
    ClassLinks.fromJson(json.decode(str));

String classLinksToJson(ClassLinks data) => json.encode(data.toJson());

class ClassLinks {
  ClassLinks({
    this.status,
    this.totalClass,
    this.classList,
  });

  String status;
  int totalClass;
  List<ClassList> classList;

  factory ClassLinks.fromJson(Map<String, dynamic> json) => ClassLinks(
        status: json["status"],
        totalClass: json["total_class"],
        classList: List<ClassList>.from(
            json["Class_List"].map((x) => ClassList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_class": totalClass,
        "Class_List": List<dynamic>.from(classList.map((x) => x.toJson())),
      };
}

class ClassList {
  ClassList({
    this.code,
    this.name,
    this.link,
    this.profilePic,
  });

  String code;
  String name;
  String link;
  String profilePic;

  factory ClassList.fromJson(Map<String, dynamic> json) => ClassList(
        code: json["Code"],
        name: json["Name"],
        link: json["Link"],
        profilePic: json["Profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "Link": link,
        "Profile_pic": profilePic,
      };
}
