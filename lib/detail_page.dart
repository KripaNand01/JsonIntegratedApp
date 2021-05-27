import 'package:flutter/material.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name),
                  Text(
                    user.email,
                    style:
                        TextStyle(fontSize: 16, color: Colors.purple.shade900),
                  ),
                ],
              ),
            ],
          )),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white60,
              elevation: 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(user.picture),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name - " + user.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Email - " + user.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Gender - " + user.gender),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Phone - " + user.phone),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Age - " + user.age.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("EyeColor - " + user.eyeColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Active - " + user.isActive.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Address - " + user.address),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Balance - " + user.balance),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Company - " + user.company),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "About - " + user.about,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
