import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String nickname;
  final String? email;
  final String role;
  final String? profileUrl;

  User({
    required this.nickname,
    this.email,
    required this.role,
    this.profileUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'email': email,
      'role': role,
      'profileUrl': profileUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nickname: map['nickname'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      role: map['role'] as String,
      profileUrl: map['profileUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(nickname: $nickname, email: $email, role: $role, profileUrl: $profileUrl)';
  }
}
