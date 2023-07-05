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

var quizQuestions = [
  {
    "question": "What does a red traffic light mean?",
    "optionA": "Stop",
    "optionB": "Go",
    "optionC": "Slow down",
    "optionD": "Merge",
    "correctOption": "Stop"
  },
  {
    "question": "What should you do when approaching a yield sign?",
    "optionA": "Stop and wait for the intersection to clear",
    "optionB": "Slow down and be prepared to stop if necessary",
    "optionC": "Speed up to merge with traffic",
    "optionD": "Ignore it and continue driving",
    "correctOption": "Slow down and be prepared to stop if necessary"
  },
  {
    "question": "What is the purpose of a crosswalk?",
    "optionA": "To mark parking spots",
    "optionB": "To indicate a no-parking zone",
    "optionC": "To provide a safe path for pedestrians",
    "optionD": "To guide cyclists",
    "correctOption": "To provide a safe path for pedestrians"
  },
  {
    "question":
        "What does a double solid yellow line in the center of the road indicate?",
    "optionA": "Passing is allowed",
    "optionB": "Passing is prohibited",
    "optionC": "Passing is allowed only during daylight hours",
    "optionD": "Passing is allowed for motorcycles only",
    "correctOption": "Passing is prohibited"
  },
  {
    "question":
        "What is the first thing you should do in the event of a car accident?",
    "optionA": "Move the vehicles to the side of the road",
    "optionB": "Call your insurance company",
    "optionC": "Check for injuries and call emergency services if needed",
    "optionD": "Exchange insurance information with the other driver",
    "correctOption": "Check for injuries and call emergency services if needed"
  },
  {
    "question": "What should you do if you miss your exit on the highway?",
    "optionA": "Reverse and go back to the exit",
    "optionB": "Make a U-turn at the next available intersection",
    "optionC": "Continue to the next exit and find an alternate route",
    "optionD": "Stop on the shoulder and wait for assistance",
    "correctOption": "Continue to the next exit and find an alternate route"
  },
  {
    "question": "When should you use your turn signals?",
    "optionA": "Only when changing lanes",
    "optionB": "Only when making a left turn",
    "optionC": "Only when making a right turn",
    "optionD":
        "When changing lanes, making a left turn, or making a right turn",
    "correctOption":
        "When changing lanes, making a left turn, or making a right turn"
  },
  {
    "question":
        "What does a solid white line on the side of the road indicate?",
    "optionA": "The edge of the road",
    "optionB": "A pedestrian crosswalk",
    "optionC": "A bike lane",
    "optionD": "No passing allowed",
    "correctOption": "The edge of the road"
  },
  {
    "question": "What does a red traffic light mean?",
    "optionA": "Stop",
    "optionB": "Go",
    "optionC": "Slow down",
    "optionD": "Merge",
    "correctOption": "Stop"
  },
    {
    "question": "What should you do when approaching a yield sign?",
    "optionA": "Stop and wait for the intersection to clear",
    "optionB": "Slow down and be prepared to stop if necessary",
    "optionC": "Speed up to merge with traffic",
    "optionD": "Ignore it and continue driving",
    "correctOption": "Slow down and be prepared to stop if necessary"
  },
];
