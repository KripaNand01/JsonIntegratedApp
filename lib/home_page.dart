import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_integrated/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<User>> _getUsers() async {
    var url = Uri.parse(
        "http://www.json-generator.com/api/json/get/bUGgkAnJNK?indent=2");
    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(
          u["index"],
          u["isActive"],
          u["balance"],
          u["picture"],
          u["age"],
          u["eyeColor"],
          u["name"],
          u["gender"],
          u["company"],
          u["email"],
          u["phone"],
          u["address"],
          u["about"]);

      users.add(user);
    }
    print("total = ${users.length}");

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Json Integrated"),
      ),
      body: Container(
        child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(snapshot.data[index]),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].picture),
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].email),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      );
                    });
              }
            }),
      ),
    );
  }
}

class User {
  User(
    this.index,
    this.isActive,
    this.balance,
    this.picture,
    this.age,
    this.eyeColor,
    this.name,
    this.gender,
    this.company,
    this.email,
    this.phone,
    this.address,
    this.about,
  );

  int index;

  bool isActive;
  String balance;
  String picture;
  int age;
  String eyeColor;
  String name;
  String gender;
  String company;
  String email;
  String phone;
  String address;
  String about;
}
