class Topic {
  const Topic({required this.subtitle, required this.txt});
  final String subtitle;
  final String txt;

  Map<String, dynamic> getMap() {
    return {"subtitle": subtitle, "txt": txt};
  }

  Topic fromjson(Map json) {
    return Topic(subtitle: json["subtitle"], txt: json["txt"]);
  }
}
