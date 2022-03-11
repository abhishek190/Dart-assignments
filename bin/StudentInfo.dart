import '../bin/CourseInfo.dart';

class StudentDetails {
  String fullName;
  int age;
  String address;
  int rollNo;
  late List<Course> course;

  StudentDetails(
      this.fullName, this.age, this.address, this.rollNo, this.course);

  void display(String courses) {
    print(
        "$fullName     $rollNo               $address                  $courses");
  }
}
