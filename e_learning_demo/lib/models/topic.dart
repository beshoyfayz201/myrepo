import 'dart:convert';

class Topic {
  const Topic({required this.subtitle, required this.txt});
  final String subtitle;
  final String txt;

 

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'subtitle': subtitle});
    result.addAll({'txt': txt});
  
    return result;
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      subtitle: map['subtitle'] ?? '',
      txt: map['txt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source));
}
