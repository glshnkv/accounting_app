import 'package:accounting_app/models/quiz_model.dart';
import 'package:accounting_app/repository/quiz_repository.dart';
import 'package:accounting_app/router/router.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:accounting_app/widgets/app_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quiz',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: AppColors.white),
                ),
                Text(
                  '${quizRepository.length} themes',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white60),
                ),
                SizedBox(height: 15),
                ListView.separated(
                  itemCount: quizRepository.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (BuildContext context, int index) {
                    final QuizModel quiz = quizRepository[index];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(QuizInfoRoute(quiz: quiz));
                      },
                      child: AppContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quiz.quiz,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21,
                                  color: AppColors.white),
                            ),
                            Text(
                              quiz.date,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.white60),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${quiz.questions.length} Questions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: AppColors.orange),
                                ),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: AppColors.white10,
                                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
