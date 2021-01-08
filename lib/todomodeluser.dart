
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.photo,
    this.name,
    this.location,
    this.email,
    this.mobile,
  });

  bool status;
  String photo;
  String name;
  String location;
  String email;
  String mobile;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    photo: json["photo"],
    name: json["name"],
    location: json["location"],
    email: json["email"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "photo": photo,
    "name": name,
    "location": location,
    "email": email,
    "mobile": mobile,
  };
}
