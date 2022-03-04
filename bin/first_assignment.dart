import 'dart:io';
import '../bin/UserInputValidation.dart';
import '../bin/UserTaxCalculator.dart';
import '../bin/exceptionHandle.dart';
import 'enum.dart';
//class Item
class Item {
  late String name;
  late double price;
  late int quantity;
  late String type;
  late double salesTax;
  late double finalPrize;

  //Parametrized Constructor to initialize member variable
  Item(this.name, this.price, this.quantity, this.type, this.salesTax, this.finalPrize);

  @override
  String toString() {
    // TODO: implement toString
    return ("item name: $name\nitem price: $price\nsales tax liability per item: $salesTax\nfinal prize: $finalPrize");
  }

}

void main() {
  var items = <Item>[];
  String? flag = "n";
  do {
    print("Enter the details of item");
    print("Enter the name of item");
    var name = stdin.readLineSync();
    print(
        "Price of item\nQuantity of item\nType of item (raw/manufactured/imported)");
    var x = stdin.readLineSync();
    var y = stdin.readLineSync();
    var z = stdin.readLineSync();
    if (name != null && x != null && y != null && z != null) {
      var l, m, n; //l,m,n store the input with correct datatype
      l = convertDataType(x);
      m = convertDataType(y);
      n = convertDataType(z);

      //Check input is valid or not
      if (checkInputValidation(name, l, m, n)) {
        double price;
        int quantity;
        String type;

        //price , quantity and type assigned with correct dataType
        price= typeAssign(checkType.double.type,l,m,n,checkType.double.value);

        quantity= typeAssign(checkType.int.type,l,m,n,checkType.int.value);

        type= typeAssign(checkType.string.type,l,m,n,checkType.string.value);

        //Sales Tax Calculate
        var salesTax = taxCalculator(type, quantity, price);

        //final prize calculate
        var finalPrize = finalPriceCalculate(salesTax, quantity, price);

        //item object initialize
        Item item = Item(name, price, quantity, type, salesTax, finalPrize);

        //item object insert to items list
        items.add(item);
      } else {
        //Invalid input exception throw
        throw InvalidInputException();
      }
    }
    print("Do you want to enter details of any other item (y/n):");
    do {
      flag = stdin.readLineSync();
      if (flag != null) {
        flag = flag.toLowerCase();
      }
      if (flag != "n" && flag != "y") {
        throw InvalidInputException("Wrong options... Please select (y/n)");
      }
    } while (flag != "n" && flag != "y");
  } while (flag == "y");

  //Display all items
  for (int i = 0; i < items.length; i++) {
    print("Item ${i + 1}:");
    print(items[i]);
  }
}
