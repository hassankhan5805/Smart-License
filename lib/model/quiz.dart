class QuizModel {
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;

  QuizModel(
      {this.question,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.correctOption});

  QuizModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    optionA = json['optionA'];
    optionB = json['optionB'];
    optionC = json['optionC'];
    optionD = json['optionD'];
    correctOption = json['correctOption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['optionA'] = this.optionA;
    data['optionB'] = this.optionB;
    data['optionC'] = this.optionC;
    data['optionD'] = this.optionD;
    data['correctOption'] = this.correctOption;
    return data;
  }
}
