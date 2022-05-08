class QuestionModel {
  String question;
  String answer;

  QuestionModel({required this.question, required this.answer});

  void setQuestion(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(String getAnswer) {
    answer = getAnswer;
  }

  String getQuestion() {
    return question;
  }

  String getAnswer() {
    return answer;
  }
}

