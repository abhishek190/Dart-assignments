import '../bin/FactoryClass.dart';
import '../bin/Item.dart';
class Manufactured extends Item{
  Manufactured(String name, double prize, int quantity, String type) : super(name, prize, quantity, type);

  @override
  double taxCalculator(String type,int quantity,double prize){
    var itemCost = quantity * prize;
    var salesTax = 0.0;
    if (itemCost == 0.0) {
      return salesTax;
    }
    var c = 0.125 * itemCost;
    salesTax = c + 0.02 * (itemCost + c);
    return salesTax;
  }
  @override
  double finalPrizeCalculate(double salesTax, int quantity, double prize){
    var itemCost = quantity * prize;
    var totalCost = itemCost + salesTax;
    return totalCost;
  }

}
