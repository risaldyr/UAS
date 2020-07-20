import 'package:http/http.dart' show Client;

import 'get.dart';

class ApiService {
  final String baseUrl = "https://thawing-stream-50060.herokuapp.com";
  Client client = Client();

  Future<List<Get1>> getGets1() async {
    final response = await client.get("$baseUrl/api/users");
    if (response.statusCode == 200) {
      return get1FromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createGet1(Get1 data) async {
    final response = await client.post(
      "$baseUrl/api/users/",
      headers: {"content-type": "application/json"},
      body: get1ToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateGet1(Get1 data) async {
    final response = await client.put(
      "$baseUrl/api/users/${data.id}",
      headers: {"content-type": "application/json"},
      body: get1ToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteGet1(String id) async {
    final response = await client.delete(
      "$baseUrl/api/users/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
}
