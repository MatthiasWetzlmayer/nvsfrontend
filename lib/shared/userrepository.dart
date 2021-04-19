import 'dart:convert';
import 'dart:io';

import 'package:nvsfrontend/shared/models/userdatadto.dart';

import 'models/fulluser.dart';
import 'models/token.dart';
import 'models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  String _baseUrl = "localhost:8080";
  Future<Token> postRegisterUser(User u) async {
    return _postUser(u, "register");
    // if(response.statusCode >=200 && response.statusCode <=299){
  }

  Future<Token> _postUser(User u, String endpoint) async{
    print(u.toRawJson());
    final response = await http.post(
      Uri.http(_baseUrl, endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: u.toRawJson(),
    );
    return Token.fromRawJson(response.body);
  }
  Future<Token> postLoginUser(User u) {
    return _postUser(u,"authenticate");
  }

  Future<List<FullUser>> searchUsers(String search, String token) async{
    var queryParameters = {
      'user': search,
    };

    final response = await http.get(
      Uri.http(_baseUrl, "search", queryParameters),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authentication': token,
      },
      );
      Iterable l = json.decode(response.body);
      return List<FullUser>.from(l.map((model)=> FullUser.fromJson(model)));
  }

  Future<UserDataDto> postUserData(UserDataDto user, String token) async{
    final response = await http.post(
      Uri.http(_baseUrl, "data"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authentication': token,
      },
      body: user.toRawJson()
    );

    return UserDataDto.fromRawJson(response.body);
  }


}
