import 'dart:convert';

class Question {
  String q;
  List<String> answers;
  int ansIndex;
  String why;
  Question(
      {required this.q,
      required this.answers,
      required this.ansIndex,
      required this.why});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'q': q});
    result.addAll({'answers': answers});
    result.addAll({'ansIndex': ansIndex});
    result.addAll({'why': why});

    return result;
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      q: map['q'] ?? '',
      answers: List<String>.from(map['answers']),
      ansIndex: map['ansIndex']?.toInt() ?? 0,
      why: map['why'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));
}
