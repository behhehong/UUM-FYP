import '../models/questionmodel.dart';

List<QuestionModel> getQuestion() {
  List<QuestionModel> questions = <QuestionModel>[];
  QuestionModel questionModel = QuestionModel(question: '', answer: '');

  //1
  // questionModel.setQuestion("Password doesn't follow keyboard pattern");
  // questionModel.setAnswer("Agree");
  questionModel = QuestionModel(
      question: "Password doesn't follow keyboard pattern", answer: 'Agree');
  questions.add(questionModel);

  //2
  questionModel = QuestionModel(
      question:
          "Password consists of lowercase, uppercase, numbers, special characters",
      answer: "Agree");
  questions.add(questionModel);

  //3
  questionModel = QuestionModel(
      question: "Passwords longer than 8 characters", answer: "Agree");
  questions.add(questionModel);

  //4
  questionModel = QuestionModel(
      question: "Passwords based on personal information", answer: "Disagree");
  questions.add(questionModel);

  //5
  questionModel =
      QuestionModel(question: "Never change password", answer: "Disagree");
  questions.add(questionModel);

  //6
  questionModel = QuestionModel(
      question: "Usage of “Remember my password” option", answer: "Disagree");
  questions.add(questionModel);

  //7
  questionModel = QuestionModel(
      question: "Used to write down the password", answer: "Disagree");
  questions.add(questionModel);

  //8
  questionModel = QuestionModel(
      question: "Never use “hint” to recover forgotten password",
      answer: "Agree");
  questions.add(questionModel);

  //9
  questionModel = QuestionModel(
      question: "Established trusted online relationship with strangers",
      answer: "Disagree");
  questions.add(questionModel);

  //10
  questionModel = QuestionModel(
      question:
          "Ignored emails from well-known organizations announcement On something unusual or too good",
      answer: "Agree");
  questions.add(questionModel);

  //11
  questionModel = QuestionModel(
      question:
          "Respond to SMS announcing contests involving huge sums of money",
      answer: "Disagree");
  questions.add(questionModel);

  //12
  questionModel = QuestionModel(
      question: "Never trust strangers information given on the Internet",
      answer: "Agree");
  questions.add(questionModel);

  //13
  questionModel = QuestionModel(
      question:
          "Never consider any amount of money for services offered by an online site",
      answer: "Disagree");
  questions.add(questionModel);

  //14
  questionModel = QuestionModel(
      question: "Willing to deposit money requested by online friends",
      answer: "Disagree");
  questions.add(questionModel);

  //15
  questionModel = QuestionModel(
      question: "Aware of and able to identify the latest online scams",
      answer: "Agree");
  questions.add(questionModel);

  //16
  questionModel = QuestionModel(
      question: "Trust strangers' pictures posted on the Internet",
      answer: "Disagree");
  questions.add(questionModel);

  //17
  questionModel = QuestionModel(
      question: "Never receive parcels and gifts from Internet friend",
      answer: "Agree");
  questions.add(questionModel);

  //18
  questionModel = QuestionModel(
      question: "Wouldn't hesitate to face-to-face with Internet friends",
      answer: "Disagree");
  questions.add(questionModel);

  return questions;
}
