import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/controllers/quiz_controller.dart';
import 'package:smartlicense/controllers/user_controller.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/utils/widgets/loading.dart';

class Quiz extends StatelessWidget {
  Quiz({super.key});
  final RxList<int> totalMarks = RxList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar:
                appBar(context: context, title: "Quiz", hideBackButton: true),
            body: Obx(() {
              if (quizContr.allquizes != null &&
                  quizContr.allquizes!.isNotEmpty) {
                return ListView.builder(
                    itemCount: quizContr.allquizes!.length + 1,
                    itemBuilder: ((context, index) {
                      return index < quizContr.allquizes!.length
                          ? QuizCard(index, totalMarks)
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customButton(
                                  "Submit Quiz",
                                  () => Reception().updateQuizRelevance(
                                      userCntr.user.value,result:totalMarks)));
                    }));
              } else
                return LoadingWidget();
            })),
        LoadingWidget()
      ],
    );
  }
}

class QuizCard extends StatelessWidget {
  QuizCard(this.index, this.totalMarks, {super.key});
  final index;
  final RxList<int> totalMarks;
  final Rx<String> gender = "".obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        gender.value;
        return Container(
            height: 50.h,
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(quizContr.allquizes![index].question!,
                    textAlign: TextAlign.center),
                Divider(),
                RadioListTile(
                  title: Text(quizContr.allquizes![index].optionA!),
                  value: quizContr.allquizes![index].optionA!,
                  groupValue: gender.value,
                  onChanged: (value) {
                    gender.value = value.toString();
                    if (value == quizContr.allquizes![index].correctOption) {
                      totalMarks[index] = 10;
                    } else {
                      totalMarks[index] = 0;
                    }
                  },
                ),
                RadioListTile(
                  title: Text(quizContr.allquizes![index].optionB!),
                  value: quizContr.allquizes![index].optionB!,
                  groupValue: gender.value,
                  onChanged: (value) {
                    gender.value = value.toString();
                    if (value == quizContr.allquizes![index].correctOption) {
                      totalMarks[index] = 10;
                    } else {
                      totalMarks[index] = 0;
                    }
                  },
                ),
                RadioListTile(
                  title: Text(quizContr.allquizes![index].optionC!),
                  value: quizContr.allquizes![index].optionC!,
                  groupValue: gender.value,
                  onChanged: (value) {
                    gender.value = value.toString();
                    if (value == quizContr.allquizes![index].correctOption) {
                      totalMarks[index] = 10;
                    } else {
                      totalMarks[index] = 0;
                    }
                  },
                ),
                RadioListTile(
                  title: Text(quizContr.allquizes![index].optionD!),
                  value: quizContr.allquizes![index].optionD!,
                  groupValue: gender.value,
                  onChanged: (value) {
                    gender.value = value.toString();
                    if (value == quizContr.allquizes![index].correctOption) {
                      totalMarks[index] = 10;
                    } else {
                      totalMarks[index] = 0;
                    }
                  },
                )
              ],
            ));
      }),
    );
  }
}
