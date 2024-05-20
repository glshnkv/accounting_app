import 'package:accounting_app/models/answer_model.dart';
import 'package:accounting_app/models/question_model.dart';
import 'package:accounting_app/models/quiz_model.dart';
import 'package:accounting_app/screens/quiz/quiz_info/widgets/message_widget.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:accounting_app/widgets/app_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class QuizInfoScreen extends StatefulWidget {
  final QuizModel quiz;

  const QuizInfoScreen({super.key, required this.quiz});

  @override
  State<QuizInfoScreen> createState() => _QuizInfoScreenState();
}

class _QuizInfoScreenState extends State<QuizInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text(
          'Quiz',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.quiz.quiz,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: AppColors.white),
                ),
                SizedBox(height: 5),
                Text(
                  '${widget.quiz.questions.length} Questions',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white60),
                ),
                SizedBox(height: 15),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.quiz.questions.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final QuestionModel question = widget.quiz.questions[index];
                    return Column(
                      children: [
                        AppContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/settings/avatar.svg',
                                    width: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      question.userName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: AppColors.white60),
                                    ),
                                  ),
                                  Text(
                                    question.date,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: AppColors.white60),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                question.question,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    color: AppColors.white),
                              ),
                              SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  if (question.isOpen) {
                                    question.isOpen = false;
                                  } else {
                                    question.isOpen = true;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: question.isOpen
                                          ? AppColors.orange
                                          : AppColors.white10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/elements/comments.svg',
                                        color: question.isOpen
                                            ? AppColors.white
                                            : AppColors.orange,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${question.answers.length}',
                                        style: TextStyle(
                                          color: question.isOpen
                                              ? AppColors.white
                                              : AppColors.orange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        question.isOpen
                            ? ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: question.answers.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                itemBuilder: (BuildContext context, int index) {
                                  final AnswerModel answer =
                                      question.answers[index];
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/settings/avatar.svg',
                                        width: 32,
                                      ),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        width: 290,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    answer.userName,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        color: AppColors.white60),
                                                  ),
                                                  Text(
                                                    answer.date,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        color: AppColors.white60),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MessageWidget(
                                              child: SizedBox(
                                                width: 270,
                                                child: Text(
                                                  answer.answer,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                      color: AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                })
                            : Container(),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
