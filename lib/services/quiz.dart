import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartlicense/model/quiz.dart';
import '../controllers/loading.dart';

class QuizServices {
  final firestore = FirebaseFirestore.instance;
  Stream<List<QuizModel>>? streamAllQuiz() {
    try {
      return firestore.collection("quiz").snapshots().map((event) {
        loading(false);
        List<QuizModel> list = [];
        event.docs.forEach((element) {
          list.add(QuizModel.fromJson(element.data()));
        });
        loading(false);
        return list;
      });
    } catch (e) {
      loading(false);
      return null;
    }
  }

  Stream<List<String>>? streamAllTrainings() {
    try {
      return firestore.collection("quizTraining").snapshots().map((event) {
        loading(false);
        List<String> list = [];
        event.docs.forEach((element) {
          list.add(element.data()['article']);
        });
        loading(false);
        return list;
      });
    } catch (e) {
      loading(false);
      return null;
    }
  }
}
