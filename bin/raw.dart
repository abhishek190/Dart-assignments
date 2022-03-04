import '../bin/factoryClass.dart';
class Raw implements ItemPrice{
  @override
  double taxCalculator(String type,int quantity,double price){
    var itemCost = quantity * price;
    var salesTax = 0.0;
    if (itemCost == 0.0) {
      return salesTax;
    }
    salesTax = 0.125 * itemCost;
    return salesTax;
  }
  @override
  double finalPriceCalculate(double salesTax, int quantity, double price){
    var itemCost = quantity * price;
    var totalCost = itemCost + salesTax;
    return totalCost;
  }
}