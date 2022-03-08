import 'StudentInfo.dart';
import 'Enum.dart';
import 'CourseInfo.dart';

List<String> listOfObjectToString(List<Course> course) {
  List<String> courses = <String>[];
  for (int i = 0; i < course.length; i++) {
    courses.add(course[i].course!);
  }
  return courses;
}

bool intValidation(var source) {
  if (source == null) {
    return false;
  }
  return double.tryParse(source) != null;
}

bool stringValidation(var source) {
  if (source.length == 0) {
    return false;
  }
  return true;
}

bool courseValidation(List<String> course, String currentCourse) {
  bool flag = false;
  for (var v in CoursesType.values) {
    if (currentCourse == v.toShortString()) {
      flag = true;
      break;
    }
  }
  if (!flag) {
    print("Not valid course");
    return false;
  }
  if (course.length == 6) {
    print("Cannot enroll more than 6 course");
    return false;
  }
  if (course.contains(currentCourse)) {
    print("Same course cannot enroll more than one");
    return false;
  }
  return true;
}

void sortUser(List<StudentDetails> userDetails,
    [String type = "name", order = "asc"]) {
  switch (type) {
    case "name":
      userDetails.sort((a, b) => a.fullName.compareTo(b.fullName) == 0
          ? a.rollNo.compareTo(b.rollNo)
          : a.fullName.compareTo(b.fullName));
      break;
    case "roll":
      userDetails.sort((a, b) => a.rollNo.compareTo(b.rollNo));
      break;
    case "age":
      userDetails.sort((a, b) => a.age.compareTo(b.age));
      break;
    case "address":
      userDetails.sort((a, b) => a.address.compareTo(b.address));
      break;
  }
  if (order == 'desc') {
    userDetails = List.from(userDetails.reversed);
  }
  print(
      '-----------------------------------------------------------------------------------');
  print(
      'Name         Roll Number            Address                   Courses');
  print(
      '-----------------------------------------------------------------------------------');
  for (int i = 0; i < userDetails.length; i++) {
    List<String> courses = listOfObjectToString(userDetails[i].course);
    String course = courses.join(",");
    userDetails[i].display(course);
  }
}
