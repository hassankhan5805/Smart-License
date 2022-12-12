import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/controllers/quiz_controller.dart';
import 'package:smartlicense/controllers/user_controller.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/utils/widgets/loading.dart';

class QuizTraining extends StatelessWidget {
  const QuizTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: appBar(
                context: context, title: "Quiz Training", hideBackButton: true),
            body: Obx(() {
              if (quizContr.allQuizTraining != null &&
                  quizContr.allQuizTraining!.isNotEmpty) {
                return ListView.builder(
                    itemCount: quizContr.allQuizTraining!.length + 1,
                    itemBuilder: ((context, index) {
                      return index < quizContr.allQuizTraining!.length
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height:
                                      quizContr.allQuizTraining![index].length *
                                          0.1.h,
                                  padding: const EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(quizContr.allQuizTraining![index],
                                      textAlign: TextAlign.center)),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customButton(
                                  "Contine to Quiz",
                                  () => Reception().updateQuizTrainingRelevance(
                                      userCntr.user.value)));
                    }));
              } else
                return LoadingWidget();
            })),
        LoadingWidget()
      ],
    );
  }
}
