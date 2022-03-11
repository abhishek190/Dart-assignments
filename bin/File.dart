import 'dart:convert';
import 'dart:io';

import 'StudentInfo.dart';
import 'UserJsonSerializable.dart';

List<StudentDetails> readFile(String contents) {
  List<dynamic> userData = [];
  List<dynamic> parsedJson = json.decode(contents);
  List<StudentDetails>userDetails=[];
  userData =
      parsedJson.map((item) => UserJsonSerializable.fromJson(item)).toList();
  for (int i = 0; i < userData.length; i++) {
    StudentDetails obj = StudentDetails(userData[i].fullName, userData[i].age,
        userData[i].address, userData[i].rollNo, userData[i].course);
    userDetails.add(obj);
  }
  return userDetails;
}

void writeFile(List<dynamic> addUserDetailsToFile) {
  File('DataCopy.txt').writeAsString(jsonEncode(addUserDetailsToFile));
  print('User Details Saved successfully');
}
