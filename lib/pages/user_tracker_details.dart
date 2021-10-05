import 'package:json_annotation/json_annotation.dart';

part 'user_tracker_details.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTrackerDetails {
  String? july;
  String? august;
  String? september;
  String? october;
  String? november;
  String? december;
  String? january;
  String? february;
  String? march;
  String? april;
  String? may;
  String? june;
  bool? isVacation;
  bool? isSickLeave;
  String? employeeName;

  UserTrackerDetails.newInstance();

  UserTrackerDetails(
      this.july,
      this.august,
      this.september,
      this.october,
      this.november,
      this.december,
      this.january,
      this.february,
      this.march,
      this.april,
      this.may,
      this.june,
      this.isVacation,
      this.isSickLeave,
      this.employeeName);

  factory UserTrackerDetails.fromJson(Map<String, dynamic> json) =>
      _$UserTrackerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserTrackerDetailsToJson(this);

  static List<UserTrackerDetails> mapFromJson(List<dynamic>? dynamicList) {
    print("DYNAMIC LIST HERE" + dynamicList.toString());
    List<UserTrackerDetails> topicList = [];
    if (dynamicList != null) {
      dynamicList.forEach((dynamic e) {
        UserTrackerDetails topic =
            UserTrackerDetails.fromJson(e as Map<String, dynamic>);
        topicList.add(topic);
      });
    }
    return topicList;
  }
}
