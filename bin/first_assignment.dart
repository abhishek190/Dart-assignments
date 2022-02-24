import 'dart:collection';
import 'dart:io';
import 'dart:convert';
//class Item
class Item{
  String? name;
  double? price;
  int? quantity;
  String? type;
  double? salesTax;
  double? finalPrize;
  Item(){
    name="";
    price=0.0;
    quantity=0;
    type="";
    salesTax=0.0;
    finalPrize=0.0;
  }
  Item.constructor1(String name,double price,int quantity,String type,double salesTax,double finalPrize){
    this.name=name;
    this.price=price;
    this.quantity=quantity;
    this.price=price;
    this.salesTax=salesTax;
    this.finalPrize=finalPrize;
  }
}
//Check variable integer or not
bool checkInt(var temp){
    if((int.tryParse(temp)).toString()==temp){
        return true;
    }
    else{
      return false;
    }
}
//Convert datatype of input
dynamic convertDataType(var x){
  if (double.tryParse(x) != null) {//Check input is numeric or string
    return checkInt(x)?int.tryParse(x):double.tryParse(x);//check input is integer or double
  }
  else{
    return x;
  }
}

//Check Input is valid or not
bool checkInputValidation(var name,var x,var y,var z){
  HashMap mp=HashMap<dynamic,dynamic>();
  mp[x.runtimeType]=x;
  mp[y.runtimeType]=y;
  mp[z.runtimeType]=z;
  if(mp.length!=3){return false;}
  else{
    bool result=true;
    mp.forEach((key, value) {
      if(key==double || key==String || key==int){
        if(key==String){
          var type=value.toLowerCase();

          if(type=="raw"||type=="manufactured" || type=="imported"){
            result=true;
          }
          else{
            result=false;
          }
        }
      }
      else{
        result=false;
      }
    });
    return result;
  }
}

//SalesTax Calculator
double taxCalculator(String type,int quantity,double price){

  var itemCost=quantity*price;
  var salesTax=0.0;
  if(itemCost==0.0){return salesTax;}
  switch(type){
    case "raw":
      salesTax+=0.125*itemCost;
      break;
    case "manufactured":
      var c=0.125*itemCost;
      salesTax+=c+0.02*(itemCost+c);
      break;
    case "imported":
      var finalCost=itemCost;
      finalCost+=0.1*(itemCost);
      salesTax+=0.1*(itemCost);
      if(finalCost<=100) {
        salesTax += 5;
      } else if(finalCost<=200) {
        salesTax+=10;
      } else {
        salesTax+=0.05*finalCost;
      }
      break;
  };
  return salesTax;
}
void main(){
  var items=<Item>[];
  String? flag="n";
    do{
      print("Enter the details of item");
      print("Enter the name of item");
       var name=stdin.readLineSync();
       print("Price of item\nQuantity of item\nType of item");
       var x=stdin.readLineSync();
       var y=stdin.readLineSync();
       var z=stdin.readLineSync();
       if(name!=null && x!=null && y!=null && z!=null) {
         var l,m,n;//l,m,n store the input with correct datatype
         l = convertDataType(x);
         m = convertDataType(y);
         n = convertDataType(z);


         //Check input is valid or not
          if(checkInputValidation(name, l, m, n)){
            double price;
            int quantity;
            String type;

            //price , quantity and type assigned
            price=l.runtimeType==double?l:(m.runtimeType==double?m:(n.runtimeType==double?n:0.0));
            quantity=l.runtimeType==int?l:(m.runtimeType==int?m:(n.runtimeType==int?n:0));
            type=l.runtimeType==String?l:(m.runtimeType==String?m:(n.runtimeType==String?n:""));

            //Sales Tax Calculate
            var salesTax=taxCalculator(type,quantity,price);

            //final prize calculate
            var finalPrize=salesTax+quantity*price;

            //item object initialize
            Item item=Item.constructor1(name,price,quantity,type,salesTax,finalPrize);

            //item object insert to items list
            items.add(item);
          }
          else{
            print("Input is not valid ");
          }
       }
       print("Do you want to enter details of any other item (y/n):");
       flag=stdin.readLineSync();
    }while(flag=="y");
}