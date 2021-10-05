import 'dart:convert';

import 'package:food_ordering_app/pages/user_tracker_details.dart';
import 'package:http/http.dart';

class UserTrackerService {
  Future<void> saveDetails(UserTrackerDetails details) async {
    final response = await post(
      Uri.parse('http://10.0.2.2:8080//userTrackerDetails/addDetails'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(details),
    );
    if (response.statusCode == 200) {
    } else {
      ;
    }
  }

  Future<void> updateDetails(UserTrackerDetails? userTrackerDetails) async {
    final response = await post(
      Uri.parse('http://10.0.2.2:8080/userTrackerDetails/updateDetails'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userTrackerDetails),
    );
    if (response.statusCode == 200) {
      print("dish edited ");
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
