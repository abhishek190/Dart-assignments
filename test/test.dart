import '../bin/first_assignment.dart';
import "package:test/test.dart";
void main() {
  String test1="01";
  String test2="+123";
  String test3="12";
  String test4="12.5";
  String test5="10";
  String test6="Bike";

  String name="Bike";
  double price=12.5;
  int quantity=10;
  String type="raw";

  String type2="Raw";
  String type3="RAw";
  String type4="other";

  group("Test input is numeric or not",(){
    test("test1",(){
      expect(checkInt(test1),false);
    });
    test("test2",(){
      expect(checkInt(test2),false);
    });
    test("test3",(){
      expect(checkInt(test3),true);
    });
  });

  group("Test input data type",(){
    test("test4",(){
      expect(convertDataType(test4).runtimeType,double);
    });
    test("test5",(){
      expect(convertDataType(test5).runtimeType,int);
    });
    test("test6",(){
      expect(convertDataType(test6).runtimeType,String);
    });
  });

  group("Check Input is correct",(){
    test("test7",(){
      expect(checkInputValidation(name,price,quantity,type),true);
    });
    test("test8",(){
      expect(checkInputValidation(name,quantity,quantity,type),false);
    });
    test("test9",(){
      expect(checkInputValidation(name,quantity,quantity,quantity),false);
    });
    test("test10",(){
      expect(checkInputValidation(name,type,type,type),false);
    });
    test("test11",(){
      expect(checkInputValidation(name,quantity,price,type2),true);
    });
    test("test12",(){
      expect(checkInputValidation(name,quantity,price,type3),true);
    });
    test("test12",(){
      expect(checkInputValidation(name,quantity,price,type4),false);
    });
    test("test12",(){
      expect(checkInputValidation(name,type3,price,type4),false);
    });
  });
  group("Test SalesTax ",(){
    test("test13",(){
      expect(taxCalculator("raw",10,12.5),15.625);
    });
    test("test14",(){
      expect(taxCalculator("manufactured",12,22.3),39.471000000000004);
    });
    test("test15",(){
      expect(taxCalculator("manufactured",0,0.0),0.0);
    });
    test("test16",(){
      expect(taxCalculator("manufactured",100,1222),18024.5);
    });
    test("test17",(){
      expect(taxCalculator("imported",12,100.0),186.0);
    });
    test("test18",(){
      expect(taxCalculator("imported",0,0.0),0.0);
    });

  });
}