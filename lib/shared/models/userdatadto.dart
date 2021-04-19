import 'dart:convert';

class UserDataDto {
    UserDataDto({
        this.birthdate,
        this.salary,
    });

    String birthdate;
    String salary;

    factory UserDataDto.fromRawJson(String str) => UserDataDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserDataDto.fromJson(Map<String, dynamic> json) => UserDataDto(
        birthdate: json["birthdate"],
        salary: json["salary"],
    );

    Map<String, dynamic> toJson() => {
        "birthdate": birthdate,
        "salary": salary,
    };
}
