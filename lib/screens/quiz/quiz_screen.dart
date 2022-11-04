import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Body(),
    );
  }
}
