// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      json['id'] as String?,
      json['employeeNumber'] as String?,
      json['name'] as String?,
      json['title'] as String?,
      json['password'] as String?,
      json['username'] as String?,
      json['isAdmin'] as String?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'employeeNumber': instance.employeeNumber,
      'name': instance.name,
      'title': instance.title,
      'password': instance.password,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
    };
