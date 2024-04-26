import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dog {
  final String name;
  final String gender;
  final DateTime? birth;
  final double? weight;
  final String? profileUrl;
  Dog({
    required this.name,
    required this.gender,
    this.birth,
    this.weight,
    this.profileUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'birth': birth?.millisecondsSinceEpoch,
      'weight': weight,
      'profileUrl': profileUrl,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      name: map['name'] as String,
      gender: map['gender'] as String,
      birth: map['birth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birth'] as int)
          : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      profileUrl:
          map['profileUrl'] != null ? map['profileUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) =>
      Dog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dog(name: $name, gender: $gender, birth: $birth, weight: $weight, profileUrl: $profileUrl)';
  }
}
