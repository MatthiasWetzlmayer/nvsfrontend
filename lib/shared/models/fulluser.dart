
import 'dart:convert';

class FullUser {
    FullUser({
        this.username,
        this.password,
        this.birthdate,
        this.salary,
    });

    String username;
    String password;
    String birthdate;
    String salary;

    factory FullUser.fromRawJson(String str) => FullUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FullUser.fromJson(Map<String, dynamic> json) => FullUser(
        username: json["username"],
        password: json["password"],
        birthdate: json["birthdate"],
        salary: json["salary"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "birthdate": birthdate,
        "salary": salary,
    };
}