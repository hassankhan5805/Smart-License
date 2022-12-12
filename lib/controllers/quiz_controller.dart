import 'package:get/get.dart';
import 'package:smartlicense/model/quiz.dart';
import 'package:smartlicense/services/quiz.dart';

final quizContr = Get.find<QuizController>();

class QuizController extends GetxController {
  RxList<QuizModel>? allquizes = <QuizModel>[].obs;
  RxList<String>? allQuizTraining = <String>[].obs;
  @override
  void onReady() {
    initQuizStream();
  }

  initQuizStream() async {
    allquizes!.bindStream(QuizServices().streamAllQuiz()!);
    allQuizTraining!.bindStream(QuizServices().streamAllTrainings()!);
  }
}
