import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import '../../../models/Questions.dart';
import 'package:flutter_svg/svg.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 130),
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
                      onPageChanged: _questionController.updateTheQnNum,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                          question: _questionController.questions[index]),
                    ),
                  ),
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
                  SizedBox(height: 150),
                ],
              ),
            )
          ],
        ));
  }
}
