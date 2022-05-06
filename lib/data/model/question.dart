class Question {
  String? uid;
  String? content;
  String? topic;
  String? email;
  String? username;
  String? answer;

  Question(
      {this.uid,
      this.content,
      this.topic,
      this.email,
      this.username,
      this.answer});

  factory Question.fromMap(map) {
    return Question(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      content: map['content'],
      topic: map['topic'],
      answer: map['answer'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'content': content,
      'topic': topic,
      'answer': answer,
    };
  }
}
