import '../bin/FactoryClass.dart';
import '../bin/Item.dart';
class Raw extends Item{

  Raw(String name, double prize, int quantity, String type) : super(name, prize, quantity, type);

  @override
  double taxCalculator(String type,int quantity,double prize){
    var itemCost = quantity * prize;
    var salesTax = 0.0;
    if (itemCost == 0.0) {
      return salesTax;
    }
    salesTax = 0.125 * itemCost;
    return salesTax;
  }
  @override
  double finalPrizeCalculate(double salesTax, int quantity, double prize){
    var itemCost = quantity * prize;
    var totalCost = itemCost + salesTax;
    return totalCost;
  }
}