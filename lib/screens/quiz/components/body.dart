import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  QuestionController _questionController = Get.put(QuestionController());

  String start_image = "assets/images/1.png";

  changeBackground() {
    String image =
        "assets/images/${_questionController.questionNumber.value}.png";
    setState(() {
      start_image = image;
    });
  }

  void changePage(int index) {
    changeBackground();
    _questionController.updateTheQnNum(index);
  }

  // const Body({
  //   Key key,
  // }) : super(key: key);
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // So that we have access our controller
    changeBackground();
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(start_image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Obx(
                      () => Text.rich(
                        TextSpan(
                          text:
                              "Question ${_questionController.questionNumber.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "/${_questionController.questions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ProgressBar(),
                  ),
                  Expanded(
                    child: PageView.builder(
                      // Block swipe to next qn
                      physics: NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      onPageChanged: changePage,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                          question: _questionController.questions[index]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
