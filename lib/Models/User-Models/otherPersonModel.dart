class OtherPerson {
  final String? id;
  final String? name;
  final String? email;
  final String? accountNo;

  const OtherPerson({this.id, this.name, this.email, this.accountNo});

  factory OtherPerson.fromJson(Map<String, dynamic> json) {
    return OtherPerson(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        accountNo: json['accountNo']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'accountNo': accountNo,
      };
}
