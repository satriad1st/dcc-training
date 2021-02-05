import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
    Account({
        this.id,
        this.fullName,
        this.email,
        this.password,
        this.phoneNumber,
        this.role,
        this.token,
    });

    String id;
    String fullName;
    String email;
    String password;
    String phoneNumber;
    String role;
    String token;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "role": role,
        "token": token,
    };
}