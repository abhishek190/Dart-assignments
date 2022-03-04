import '../bin/FactoryClass.dart';
import '../bin/Item.dart';
class Imported extends Item{
  Imported(String name, double prize, int quantity, String type) : super(name, prize, quantity, type);

  @override
  double taxCalculator(String type,int quantity,double prize){
    var itemCost = quantity * prize;
    var salesTax = 0.0;
    if (itemCost == 0.0) {
      return salesTax;
    }
    var finalCost = itemCost;
    finalCost += 0.1 * (itemCost);
    salesTax = 0.1 * (itemCost);
    if (finalCost <= 100) {
      salesTax += 5;
    } else if (finalCost <= 200) {
      salesTax += 10;
    } else {
      salesTax += 0.05 * finalCost;
    }
    return salesTax;
  }
  @override
  double finalPrizeCalculate(double salesTax, int quantity, double prize){
    var itemCost = quantity * prize;
    var totalCost = itemCost + salesTax;
    return totalCost;
  }
}