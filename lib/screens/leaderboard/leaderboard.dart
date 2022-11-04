import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LeaderboardScreen extends StatefulWidget {
  @override
  LeaderboardScreenState createState() => new LeaderboardScreenState();
}

class LeaderboardScreenState extends State<LeaderboardScreen> {
  List data;

  Future<String> getData() async {
    var response =
    // await http.get(
    //     Uri.encodeFull("https://smokyquiz.herokuapp.com/getLeaderboard"),
    //     headers: {"Accept": "application/json"});
    "[\r\n      {\r\n        \"name\": \"abc\"\r\n      },\r\n      {\r\n        \"name\": \"def\"\r\n      }\r\n    ]";

    this.setState(() {
      data = json.decode(response);
    });

    print(data[1]["name"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // TextButton(onPressed: _controller.nextQuestion, child: Text("Leaderboard")),
        ],
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["name"]),
          );
        },
      ),
    );
  }
}
