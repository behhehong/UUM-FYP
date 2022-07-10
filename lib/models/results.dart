class Results {
  String? user_id;
  String? user_email;
  String? question_correct;
  String? question_incorrect;
  String? question_notattempt;
  String? survey_score;
  String? survey_rating;
  String? survey_desc;
  String? survey_date;

  Results(
      {this.user_id,
      this.user_email,
      this.question_correct,
      this.question_incorrect,
      this.question_notattempt,
      this.survey_score,
      this.survey_rating,
      this.survey_desc,
      this.survey_date});

  Results.fromJson(Map<String, dynamic> json) {
    user_id = json["user_id"];
    user_email = json["user_email"];
    question_correct = json["question_correct"];
    question_incorrect = json["question_incorrect"];
    question_notattempt = json["question_notattempt"];
    survey_score = json["survey_score"];
    survey_rating = json['survey_rating'];
    survey_desc = json['survey_desc'];
    survey_date = json['survey_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = user_id;
    data['user_email'] = user_email;
    data['question_correct'] = question_correct;
    data['question_incorrect'] = question_incorrect;
    data['question_notattempt'] = question_notattempt;
    data['survey_score'] = survey_score;
    data['survey_rating'] = survey_rating;
    data['survey_desc'] = survey_desc;
    data['survey_date'] = survey_date;
    return data;
  }
}
