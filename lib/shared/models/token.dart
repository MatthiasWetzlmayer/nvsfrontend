import 'dart:convert';

class Token {
    Token({
        this.token,
    });

    String token;

    factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}