class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  { 
    "id": 1, 
    "question": "Password doesn't follow keyboard pattern", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 2, 
    "question": "Password consists of lowercase, uppercase, numbers, special characters", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 3, 
    "question": "Passwords longer than 8 characters", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 4, 
    "question": "Passwords based on personal information", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 5, 
    "question": "Never change password", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 6, 
    "question": "Usage of “Remember my password” option", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 7, 
    "question": "Used to write down the password", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 8, 
    "question": "Never use “hint” to recover forgotten password", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 9, 
    "question": "Established trusted online relationship with strangers", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 10, 
    "question": "Ignored emails from well-known organizations announcement On something unusual or too good", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 11, 
    "question": "Respond to SMS announcing contests involving huge sums of money", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 12, 
    "question": "Never trust strangers information given on the Internet", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 13, 
    "question": "Never consider any amount of money for services offered by an online site", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 14, 
    "question": "Willing to deposit money requested by online friends", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 15, 
    "question": "Aware of and able to identify the latest online scams", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 16, 
    "question": "Trust strangers' pictures posted on the Internet", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
  { 
    "id": 17, 
    "question": "Never receive parcels and gifts from Internet friend", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 1, 
  },
  { 
    "id": 18, 
    "question": "Wouldn't hesitate to face-to-face with Internet friends", 
    "options": ['Agree', 'Disagree'], 
    "answer_index": 2, 
  },
];