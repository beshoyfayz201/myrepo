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

  Map<String,dynamic> getMap() {
    return {
      "q": this.q,
      "answers": this.answers,
      "asnsIndex": this.ansIndex,
      "why": why,
    };
  }

  Question fromJson(Map<String, dynamic> json) {
   return Question(ansIndex: json["ansIndex"],
   answers: json["answers"],
   q: json["q"],
   why: json["why"]
   );
  }
}
