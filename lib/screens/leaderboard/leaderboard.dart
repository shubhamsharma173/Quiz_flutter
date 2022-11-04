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
    var response = "[\r\n      {\r\n        \"title\": \"abc\"\r\n      },\r\n      {\r\n        \"title\": \"def\"\r\n      }\r\n    ]";
    // await http.get(
    //     Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
    //     headers: {
    //       "Accept": "application/json"
    //     }
    // );

    this.setState(() {
      data = json.decode(response);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState(){
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context){
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
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}
