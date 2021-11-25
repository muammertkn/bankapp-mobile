class OtherPerson {
  final String? id;
  final String? fullname;
  final String? email;
  final String? accountId;

  const OtherPerson({this.id, this.fullname, this.email, this.accountId});

  factory OtherPerson.fromJson(Map<String, dynamic> json) {
    return OtherPerson(
        id: json['_id'],
        fullname: json['fullname'],
        email: json['email'],
        accountId: json['accountId']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': fullname,
        'email': email,
        'accountId': accountId,
      };
}
