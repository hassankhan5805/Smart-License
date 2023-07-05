import 'package:get/get.dart';
import 'package:smartlicense/model/quiz.dart';
import 'package:smartlicense/services/quiz.dart';

final quizContr = Get.find<QuizController>();

class QuizController extends GetxController {
  List<QuizModel>? allquizes ;
  RxList<String>? allQuizTraining = <String>[].obs;
  @override
  void onReady() {
    initQuizStream();
  }

  initQuizStream() async {
    allquizes = [];
        quizQuestions.forEach((element) {
          allquizes!.add(QuizModel.fromJson(element));
        });
    allQuizTraining!.bindStream(QuizServices().streamAllTrainings()!);
  }
}
