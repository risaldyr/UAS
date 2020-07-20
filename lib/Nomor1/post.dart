import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  int age;

  PostResult({this.id, this.name, this.job, this.age});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        age: object['age']);
  }

  static Future<PostResult> connectToAPI(
      String name, String job, String age) async {
    String apiURL = "https://thawing-stream-50060.herokuapp.com/api/users/";

    var apiResult =
        await http.post(apiURL, body: {"name": name, "job": job, "age": age});
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
