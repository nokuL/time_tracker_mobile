import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable(explicitToJson: true)
class Employee {
  String? id;
  String? employeeNumber;
  String? name;
  String? title;
  String? password;
  String? username;
  String? isAdmin;
  Employee.newInstance();

  Employee(this.id, this.employeeNumber, this.name, this.title, this.password,
      this.username, this.isAdmin);

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  static List<Employee> mapFromJson(List<dynamic>? dynamicList) {
    print("DYNAMIC LIST HERE" + dynamicList.toString());
    List<Employee> topicList = [];
    if (dynamicList != null) {
      dynamicList.forEach((dynamic e) {
        Employee topic = Employee.fromJson(e as Map<String, dynamic>);
        topicList.add(topic);
      });
    }
    return topicList;
  }
}
