import 'package:json_annotation/json_annotation.dart';

part 'CourseInfo.g.dart';

@JsonSerializable()
class Course {
  String? course;

  Course(this.course);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
