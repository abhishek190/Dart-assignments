import 'dart:io';
import '../bin/UserInputValidation.dart';
import '../bin/ExceptionHandle.dart';
import 'Enum.dart';
import '../bin/FactoryClass.dart';
//class Item
abstract class Item {
  late String name;
  late double prize;
  late int quantity;
  late String type;

  Item(this.name,this.prize,this.quantity,this.type);

  double taxCalculator(String type,int quantity,double prize);

  double finalPrizeCalculate(double salesTax, int quantity, double prize);

}

void main() {
  List<String> item=<String>[];
  String? flag = "n";
  do {
    print("Enter the details of item");
    print("Enter the name of item");
    var name = stdin.readLineSync();
    print(
        "Prize of item\nQuantity of item\nType of item (raw/manufactured/imported)");
    var x = stdin.readLineSync();
    var y = stdin.readLineSync();
    var z = stdin.readLineSync();
    if (name != null && x != null && y != null && z != null) {
      var l, m, n; //l,m,n store the input with correct datatype
      l = convertDataType(x);
      m = convertDataType(y);
      n = convertDataType(z);

      //Check input is valid or not
      try{
        if (!checkInputValidation(name, l, m, n)) {
          throw ValueException();
        }
        double prize;
        int quantity;
        Type type;

        //prize , quantity and type assigned with correct dataType
        prize= typeAssign(checkType.double.type,l,m,n,checkType.double.value);

        quantity= typeAssign(checkType.int.type,l,m,n,checkType.int.value);

        type= typeAssign(checkType.string.type,l,m,n,checkType.string.value);

          //factory class instance
          dynamic tax = FactoryClass().itemFactory(type,name,prize,quantity,type.toShortString());

          //sales Tax calculate
          var salesTax = tax.taxCalculator(type.toShortString(), quantity, prize);

          //final prize calculate
          var finalPrize = tax.finalPrizeCalculate(salesTax, quantity, prize);

          item.add("item name $name\nitem prize $prize\nsales tax liability per item $salesTax\nfinal prize $finalPrize");


      } catch(e) {
        //Invalid input exception throw
        print(ValueException().iOException());
      }
    }
    print("Do you want to enter details of any other item (y/n):");
    do {
      flag = stdin.readLineSync();
      flag = flag?.toLowerCase();
      try{
        if (flag != "n" && flag != "y") {
          throw ValueException();
        }
      }
      catch(e){
        print(ValueException().iOException());
      }
    } while (flag != "n" && flag != "y");

  } while (flag == "y");

  for(int i=0;i<item.length;i++){
    print(item[i]);
  }
}
