import '../bin/factoryClass.dart';
class Imported implements ItemPrice{
  @override
  double taxCalculator(String type,int quantity,double price){
    var itemCost = quantity * price;
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
  double finalPriceCalculate(double salesTax, int quantity, double price){
    var itemCost = quantity * price;
    var totalCost = itemCost + salesTax;
    return totalCost;
  }
}