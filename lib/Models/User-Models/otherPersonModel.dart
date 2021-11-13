class OtherPerson {
  final String? id;
  final String? name;
  final String? email;
  final String? accountId;

  const OtherPerson({this.id, this.name, this.email, this.accountId});

  factory OtherPerson.fromJson(Map<String, dynamic> json) {
    return OtherPerson(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        accountId: json['accountId']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'accountId': accountId,
      };
}
