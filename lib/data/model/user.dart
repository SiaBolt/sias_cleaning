class UserModel {
  String? uid;
  String? email;
  String? username;
  String? number;
  String? dob;

  UserModel({
    this.uid,
    this.email,
    this.username,
    this.number,
    this.dob,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      number: map['number'],
      dob: map['dob'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'number': number,
      'dob': dob,
    };
  }
}
