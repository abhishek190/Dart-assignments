import 'dart:io';
import '../bin/StudentInfo.dart';
import '../bin/CourseInfo.dart';
import '../bin/ExceptionHandling.dart';
import '../bin/UserJsonSerializable.dart';
import 'UtilityClass.dart';
import 'File.dart';

Future<void> main() async {
  late List<StudentDetails> userDetails = <StudentDetails>[];

  //read file
  final File file = File('DataCopy.txt');
  if (await file.exists()) {
    var contents = await file.readAsString();
    if (contents.isNotEmpty) {
      userDetails.add(readFile(contents)!);
    }
  }

  String? flag = 'y';
  outerloop:
  do {
    print(
        "1. Add User details\n2. Display User details\n3. Delete User details\n4. Save User details\n5. Exit");
    String? option = stdin.readLineSync();
    switch (option) {
      case '1':
        //User Credential
        var fullName, age, address, roll;
        List<String> course = [];
        print("Enter Student Details:");
        print("Student Full Name: ");
        fullName = stdin.readLineSync();
        print("Student age: ");
        age = stdin.readLineSync();
        print("Student address: ");
        address = stdin.readLineSync();
        print("Student Roll no: ");
        roll = stdin.readLineSync();
        //Check Input is valid or not
        try {
          //parsing age and roll No string to int
          if (!intValidation(age) ||
              !intValidation(roll) ||
              !stringValidation(fullName) ||
              !stringValidation(address)) {
            //print("Input is not valid");
            throw ValueException();
          }
          age = int.parse(age);
          roll = int.parse(roll);
          String? courseAdd = 'y';
          //Choose Course
          do {
            print("Select atleast 4 course from Course A/B/C/D/E/F");
            String? currentCourse = stdin.readLineSync();
            if (currentCourse != null) {
              if (courseValidation(course, currentCourse)) {
                course.add(currentCourse);
              }
            }
            if (course.length >= 4) {
              print("Choose another Course? (y/n)");
              courseAdd = stdin.readLineSync();
              courseAdd = courseAdd?.toLowerCase();
            }
          } while (courseAdd == 'y');

          //Create Instance of Course
          List<Course> courseObject = <Course>[];
          for (int i = 0; i < course.length; i++) {
            Course obj = Course(course[i]);
            courseObject.add(obj);
          }

          //Student_Details instance
          StudentDetails user =
              StudentDetails(fullName, age, address, roll, courseObject);

          //User Details added
          userDetails.add(user);

          //Sort User default ascending Order
          sortUser(userDetails);
        } catch (e) {
          print(ValueException().IOException());
        }

        break;
      case '2':
        print('Sort (Asc/Desc)');
        String? order = stdin.readLineSync()?.toLowerCase();
        print('Sort based on (name/Roll/age/address)');
        String? sortBasedOn = stdin.readLineSync()?.toLowerCase();
        try {
          if ((order != 'asc' && order != 'desc') ||
              sortBasedOn != 'name' &&
                  sortBasedOn != 'roll' &&
                  sortBasedOn != 'age' &&
                  sortBasedOn != 'address') {
            throw ValueException();
          }
          sortUser(userDetails, sortBasedOn!, order);
        } catch (e) {
          print(ValueException().IOException());
        }

        break;

      case '3':
        print("Enter roll number: ");
        int userRollNo = int.parse(stdin.readLineSync()!);
        int index = -1;
        for (int i = 0; i < userDetails.length; i++) {
          if (userDetails[i].rollNo == userRollNo) {
            index = i;
            break;
          }
        }
        try {
          if (index == -1) {
            throw ValueException();
          }
          dynamic res = userDetails.removeAt(index);
          print("User with roll No $userRollNo deleted successfully");
        } catch (e) {
          print(ValueException().InputRollNotFound());
        }

        break;
      case '4':
        List<dynamic> addUserDetailsToFile = [];

        for (int i = 0; i < userDetails.length; i++) {
          var map1 = UserJsonSerializable(
              userDetails[i].fullName,
              userDetails[i].age,
              userDetails[i].address,
              userDetails[i].rollNo,
              userDetails[i].course);

          addUserDetailsToFile.add(map1.toJson());
        }

        //write File
        writeFile(addUserDetailsToFile);
        break;
      case '5':
        break outerloop;
      default:
        print("Wrong option");
    }
    print("Want to continue (y/n)");
    flag = stdin.readLineSync();

    flag = flag?.toLowerCase();
    try {
      if (flag != 'y' && flag != 'n') {
        throw ValueException();
      }
    } catch (e) {
      print(ValueException().IOException());
    }
  } while (flag == 'y');
}
