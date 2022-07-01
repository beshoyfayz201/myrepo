class Topic {
  const Topic({required this.subtitle, required this.txt});
  final String subtitle;
  final String txt;

  Map<String, dynamic> getMap() {
    return {"subTitle": subtitle, "text": txt,"algorithm":"62bc8c1a0dbaf15ada8c07d0"};
  }

  Topic fromjson(Map json) {
    return Topic(subtitle: json["subTitle"], txt: json["text"]);
  }
}
