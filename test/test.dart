import '../bin/first_assignment.dart';
import "package:test/test.dart";
void main() {
  String test1="12.5";
  String test2="10";
  String test3="Bike";
  group("Test input data type",(){
    test("test1",(){
      expect(convertDataType(test1).runtimeType,double);
    });
    test("test2",(){
      expect(convertDataType(test2).runtimeType,int);
    });
    test("test3",(){
      expect(convertDataType(test3).runtimeType,String);
    });
  });
}