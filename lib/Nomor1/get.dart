import 'dart:convert';

class Get1 {
  String id;
  String name;
  String job;
  int age;

  Get1({this.id, this.name, this.job, this.age});

  factory Get1.fromJson(Map<String, dynamic> map) {
    return Get1(
        id: map["_id"], name: map["name"], job: map["job"], age: map["age"]);
  }

  String get $id => null;

  Map<String, dynamic> toJson() {
    return {"_id": id, "name": name, "job": job, "age": age};
  }

  @override
  String toString() {
    return 'Get1{_id: $id, name: $name, job: $job, age: $age}';
  }
}

List<Get1> get1FromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Get1>.from(data.map((item) => Get1.fromJson(item)));
}

String get1ToJson(Get1 data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
