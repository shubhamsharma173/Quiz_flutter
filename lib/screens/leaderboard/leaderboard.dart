import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/constants.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  LeaderboardScreenState createState() => new LeaderboardScreenState();
}

class LeaderboardScreenState extends State<LeaderboardScreen> {
  List data = [];

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://smokyquiz.herokuapp.com/getLeaderboard"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        constraints: BoxConstraints.expand(),
        color: Color(0xFF8D644B),
        child: new Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              // Flutter show the back button automatically
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [],
            ),
            body: Stack(children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Score',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Duration',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  )),
                ],
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 30),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        data[index]["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        data[index]["city"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ))),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              data[index]["score"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 20),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              data[index]["timeTaken"].toString() != "null"
                                  ? data[index]["timeTaken"].toString() + "s"
                                  : "NA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(height: 20),
                          ],
                        ))
                      ],
                    );
                  }),
            ])));
  }
}
