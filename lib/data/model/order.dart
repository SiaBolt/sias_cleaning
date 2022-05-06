class Order {
  String? id;
  String? content;
  int? total;
  String? date;
  String? address;
  String? descriptionOfBuilding;
  String? username;
  String? number;
  String? email;
  int? status;

  Order(
      {this.id,
      this.content,
      this.total,
      this.date,
      this.address,
      this.descriptionOfBuilding,
      this.username,
      this.number,
      this.email,
      this.status});

  factory Order.fromMap(map) {
    return Order(
      id: map['id'],
      content: map['content'],
      total: map['total'],
      date: map['date'],
      address: map['address'],
      descriptionOfBuilding: map['descriptionOfBuilding'],
      username: map['username'],
      number: map['number'],
      email: map['email'],
      status: map['status'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'total': total,
      'address': address,
      'descriptionOfBuilding': descriptionOfBuilding,
      'username': username,
      'number': number,
      'email': email,
      'status': status,
      'date': date,
    };
  }
}
