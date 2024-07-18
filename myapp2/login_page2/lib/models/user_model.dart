class User {
  int? id;
  String mobile;

  User({this.id, required this.mobile});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mobile': mobile,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      mobile: map['mobile'],
    );
  }
}
