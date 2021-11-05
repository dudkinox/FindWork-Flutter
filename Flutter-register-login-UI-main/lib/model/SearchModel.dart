import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';

import 'jobModel.dart';

class User {
  final String id;
  final String company;
  final DepartmentId departmentId;
  final String district;
  final String image;
  final String jobId;
  final String province;
  final String subDistrict;

  const User({
    this.id,
    this.company,
    this.departmentId,
    this.district,
    this.image,
    this.jobId,
    this.province,
    this.subDistrict,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        company: json["company"],
        departmentId: DepartmentId.fromJson(json["department_id"]),
        district: json["district"],
        image: json["image"],
        jobId: json["job_id"],
        province: json["province"],
        subDistrict: json["sub_district"],
      );
}

class DepartmentId {
  DepartmentId({
    this.salary,
    this.status,
    this.detail,
    this.name,
    this.type,
    this.partTime,
    this.jobTime,
  });

  var salary = [];
  var status = [];
  var detail = [];
  var name = [];
  var type = [];
  var partTime = [];
  var jobTime = [];

  factory DepartmentId.fromJson(Map<String, dynamic> json) => DepartmentId(
        salary: List<String>.from(json["salary"].map((x) => x)),
        status: List<bool>.from(json["status"].map((x) => x)),
        detail: List<String>.from(json["detail"].map((x) => x)),
        name: List<String>.from(json["name"].map((x) => x)),
        type: List<String>.from(json["type"].map((x) => x)),
        partTime: List<String>.from(json["part_time"].map((x) => x)),
        jobTime: List<String>.from(json["job_time"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "salary": List<dynamic>.from(salary.map((x) => x)),
        "status": status,
        "detail": List<dynamic>.from(detail.map((x) => x)),
        "name": List<dynamic>.from(name.map((x) => x)),
        "type": List<dynamic>.from(type.map((x) => x)),
        "part_time": List<dynamic>.from(partTime.map((x) => x)),
        "job_time": List<dynamic>.from(jobTime.map((x) => x)),
      };
}
// class UserApi {
//   static Future<List<User>> getUserSuggestions(String query) async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List users = json.decode(response.body);

//       return users.map((json) => User.fromJson(json)).where((user) {
//         final nameLower = user.name.toLowerCase();
//         final queryLower = query.toLowerCase();

//         return nameLower.contains(queryLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }
// }

// Future<List<JobDataModel>> TopicWork() async {
//   final String url = Host + "/api/employer";
//   final response = await http.get(
//     Uri.parse(url),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//   List jsonResponse = json.decode(response?.body);
//   return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
// }

class UserApi {
  static Future<List<User>> getUserSuggestions(String query) async {
    final String url = Host + "/api/employer";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.company.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
