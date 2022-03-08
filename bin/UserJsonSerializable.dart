import 'package:json_annotation/json_annotation.dart';
import '../bin/CourseInfo.dart';

part 'UserJsonSerializable.g.dart';

@JsonSerializable(explicitToJson: true)
class UserJsonSerializable {
  String? fullName;
  int? age;
  String? address;
  int? rollNo;
  late List<Course> course;

  UserJsonSerializable(
      this.fullName, this.age, this.address, this.rollNo, this.course);

  factory UserJsonSerializable.fromJson(Map<String, dynamic> json) =>
      _$UserJsonSerializableFromJson(json);

  Map<String, dynamic> toJson() => _$UserJsonSerializableToJson(this);
}
