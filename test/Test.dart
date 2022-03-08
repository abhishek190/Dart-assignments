import '../bin/StudentInfo.dart';
import "package:test/test.dart";

import '../bin/UtilityClass.dart';

void main() {
  StudentDetails A=StudentDetails("Abhishek",12,"asdasd",1,[]);
  StudentDetails B=StudentDetails("Ravi",13,"asdasd",2,[]);
  group("check input validation",(){
    test('test1',(){
      expect(intValidation("asdwe"),false);
    });
    test('test2',(){
      expect(intValidation(''),false);
    });
    test('test3',(){
      expect(intValidation('124'),true);
    });
    test('test4',(){
      expect(stringValidation(""),false);
    });
    test('test5',(){
      expect(stringValidation("sdaas1231"),true);
    });
  });
  group("Course validation",(){
    test('test6',(){
      expect(courseValidation([],'A'),true);
    });
    test('test7',(){
      expect(courseValidation([],''),false);
    });
    test('test8',(){
      expect(courseValidation(['A'],'A'),false);
    });
    test('test9',(){
      expect(courseValidation([],'C'),true);
    });
  });


}
