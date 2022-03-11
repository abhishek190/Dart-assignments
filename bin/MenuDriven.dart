//import 'dart:html';
import 'dart:io';
import '../bin/StudentInfo.dart';
import '../bin/CourseInfo.dart';
import '../bin/ExceptionHandling.dart';
import '../bin/UserJsonSerializable.dart';
import 'Enum.dart';
import 'UtilityClass.dart';
import 'File.dart';

Future<void> main() async {
  late List<StudentDetails> userDetails = <StudentDetails>[];

  //read file
  final File file = File('DataCopy.txt');
  if (await file.exists()) {
    var contents = await file.readAsString();
    if (contents.isNotEmpty) {
      userDetails=readFile(contents);
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
        bool ageValidationCheck=false;
        do{
          print("Student age: ");
          age = stdin.readLineSync();
          try{
            if(!intValidation(age)){
              throw ValueException;
            }
            ageValidationCheck=true;
          }
          catch(e){
            print(ValueException().IOException());
          }
        }while(ageValidationCheck==false);
        print("Student address: ");
        address = stdin.readLineSync();
        bool rollValidationCheck=false;
        do{
          print("Student Roll no: ");
          roll = stdin.readLineSync();
          try{
            if(!intValidation(roll)){
              throw ValueException;
            }
            rollValidationCheck=true;
          }
          catch(e){
            print(ValueException().IOException());
          }
        }while(rollValidationCheck==false);

        //Check Input is valid or not
        try {
          //parsing age and roll No string to int
          if (!intValidation(age) ||
              !intValidation(roll)) {
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
        try {
          if(userDetails.isEmpty){
            throw ValueException();
          }
          displayUserDetails(userDetails);
          String? check='n';
          do {
            print("Want to sort? (y/n)");
            check = stdin.readLineSync();

            check = check?.toLowerCase();
            try {
              if (check != 'y' && check != 'n') {
                throw ValueException();
              }
            } catch (e) {
              print(ValueException().IOException());
            }
          } while (check != 'y' && check != 'n');
          if(check=='y') {
            print('Sort (Asc/Desc)');
            String? order = stdin.readLineSync()?.toLowerCase();
            if(order=='a'){order='asc';}
            if(order=='d' || order=='des'){order='desc';}
            try {
              if (order != 'asc' && order != 'desc') {
                throw ValueException();
              }
              print('Sort based on (name/Roll/age/address)');
              String? sortBasedOnInput=stdin.readLineSync();
              dynamic sortBasedOn;
              if(intValidation(sortBasedOnInput)==true){
                sortBasedOn=int.tryParse(sortBasedOnInput!);
              }
              else {
                sortBasedOn = sortBasedOnInput?.toLowerCase();
              }
              bool sortValidation=false;
              for(var element in SortName.values){
                if(sortBasedOn==element.toShortString() || sortBasedOn==element.value){
                  print(element.toShortString());
                  sortBasedOn=element.toShortString();
                  sortValidation=true;
                }
              }
              try {
                if (sortValidation == false) {
                    throw ValueException();
                }
                sortUser(userDetails, sortBasedOn!, order);
              }
              catch(e){
                print(ValueException().IOException());
              }
            } catch (e) {
              print(ValueException().IOException());
            }
          }
        }
        catch(e){
          print(ValueException().NoUserFound());
        }

        break;

      case '3':
        try {
          if(userDetails.isEmpty){
            throw ValueException();
          }
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
        }
        catch(e){
          print(ValueException().NoUserFound());
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
    do {
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
    } while (flag != 'y' && flag != 'n');
  } while (flag == 'y');
}
