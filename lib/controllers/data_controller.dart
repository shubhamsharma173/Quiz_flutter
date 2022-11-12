import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../../../controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// We use get package for our state management

class DataController extends GetxController
    with GetSingleTickerProviderStateMixin {
  QuestionController _qnController = Get.put(QuestionController());

  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    this.clearTextFieldOnStart();
  }

  bool buttonEnabled = false;
  final textController_1 = TextEditingController();
  final textController_2 = TextEditingController();
  final textController_3 = TextEditingController();

  clearTextFieldOnStart() {
    textController_1.clear();
    textController_2.clear();
    textController_3.clear();
  }

  Future<String> submitScore() async {
    if (!checkTextFieldEmpty()) {
      return "Empty Field";
    } else {
      var response =
          await http.post(Uri.parse("https://smokyquiz.herokuapp.com/post"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'name': this.textController_1.text,
                'mobile': this.textController_2.text,
                'city': this.textController_3.text,
                'score': (_qnController.numOfCorrectAns * 20).toString(),
                'timeTaken': (_qnController.timeTaken * 10).toStringAsFixed(2),
              }));
      print(response.statusCode);
      clearTextFieldOnStart();
//place if condition

      return "Success!";
    }
  }

  checkTextFieldEmpty() {
    // Creating 3 String Variables.
    String text1, text2, text3;

    // Getting Value From Text Field and Store into String Variable
    text1 = textController_1.text;
    text2 = textController_2.text;
    text3 = textController_3.text;

    // Checking all TextFields.
    if (text1 == '' || text2 == '' || text3 == '' || text2.length < 10) {
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');
      return false;
    } else {
      // Put your code here, which you want to execute when Text Field is NOT Empty.
      print('Not Empty, All Text Input is Filled.');
      return true;
    }
  }
}
