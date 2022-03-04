import 'enum.dart';
import '../bin/raw.dart';
import '../bin/manufactured.dart';
import '../bin/imported.dart';
abstract class ItemPrice{
  factory ItemPrice(Type type){
    switch(type){
      case Type.raw:return Raw();
      case Type.manufactured:return Manufactured();
      case Type.imported:return Imported();
      //default:return null;
    }
  }
  double taxCalculator(String type,int quantity,double price);
  double finalPriceCalculate(double salesTax, int quantity, double price);
}


