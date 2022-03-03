//SalesTax Calculator
double taxCalculator(String type, int quantity, double price) {
  var itemCost = quantity * price;
  var salesTax = 0.0;
  if (itemCost == 0.0) {
    return salesTax;
  }
  switch (type) {
    case "raw":
      salesTax = 0.125 * itemCost;
      break;
    case "manufactured":
      var c = 0.125 * itemCost;
      salesTax = c + 0.02 * (itemCost + c);
      break;
    case "imported":
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
      break;
  }
  return salesTax;
}

//final Price calculate
double finalPriceCalculate(double salesTax, int quantity, double price) {
  var itemCost = quantity * price;
  var totalCost = itemCost + salesTax;
  return totalCost;
}