// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserJsonSerializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJsonSerializable _$UserJsonSerializableFromJson(
        Map<String, dynamic> json) =>
    UserJsonSerializable(
      json['fullName'] as String?,
      json['age'] as int?,
      json['address'] as String?,
      json['rollNo'] as int?,
      (json['course'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserJsonSerializableToJson(
        UserJsonSerializable instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'age': instance.age,
      'address': instance.address,
      'rollNo': instance.rollNo,
      'course': instance.course.map((e) => e.toJson()).toList(),
    };
