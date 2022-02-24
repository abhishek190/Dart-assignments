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
void main(){
  String flag="n";
    do{
      print("Enter the details of item");
      print("Enter the name of item");
       var name=stdin.readLineSync();
       print("Price of item\nQuantity of item\nType of item");
       var x=stdin.readLineSync();
       var y=stdin.readLineSync();
       var z=stdin.readLineSync();
       if(x!=null && y!=null && z!=null) {
         var l,m,n;//l,m,n store the input with correct datatype
         l = convertDataType(x);
         m = convertDataType(y);
         n = convertDataType(z);


         //Check input is valid or not
          if(checkInputValidation(name, l, m, n)){

          }
          else{
            print("Input is not valid ");
          }
       }
    }while(flag=="y");
}