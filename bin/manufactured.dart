import '../bin/factoryClass.dart';
class Manufactured implements ItemPrice{
  @override
  double taxCalculator(String type,int quantity,double price){
    var itemCost = quantity * price;
    var salesTax = 0.0;
    if (itemCost == 0.0) {
      return salesTax;
    }
    var c = 0.125 * itemCost;
    salesTax = c + 0.02 * (itemCost + c);
    return salesTax;
  }
  @override
  double finalPriceCalculate(double salesTax, int quantity, double price){
    var itemCost = quantity * price;
    var totalCost = itemCost + salesTax;
    return totalCost;
  }
}