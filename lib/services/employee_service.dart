import 'dart:convert';

import 'package:food_ordering_app/models/employee.dart';
import 'package:food_ordering_app/pages/user_tracker_details.dart';
import 'package:http/http.dart';

class EmployeeService {
  Future<int> saveDetails(Employee employee) async {
    final response = await post(
      Uri.parse('http://10.0.2.2:8080/employees/addEmployee'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(employee),
    );
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      return 0;
    }
  }

  Future<void> login(Employee? employee) async {
    final response = await post(
      Uri.parse('http://10.0.2.2:8080/employees/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(employee),
    );
    if (response.statusCode == 200) {
      print("employee ");
    } else {
      ;
    }
  }

  Future<List<UserTrackerDetails>> getDetails() async {
    Response response = await get(
        Uri.parse('http:http://10.0.2.2:8080:8080/userTrackerDetails'));
    final detailsDecoded = jsonDecode(response.body) as List<dynamic>?;
    final details = UserTrackerDetails.mapFromJson(detailsDecoded);
    return details;
  }

  Future<void> deleteDetails(String? detailsId) async {
    Response response = await delete(Uri.parse(
        'http:http://10.0.2.2:8080/userTrackerDetails/deleteDetails/$detailsId'));
  }
}
