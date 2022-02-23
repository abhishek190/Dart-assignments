import 'dart:collection';
import 'dart:io';
import 'dart:convert';
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
  if (double.tryParse(x) != null) {
    return checkInt(x)?int.tryParse(x):double.tryParse(x);
  }
  else{
    return x;
  }
}
void main(){
  String flag="n";
    do{
       var name=stdin.readLineSync();
       var x=stdin.readLineSync();
       var y=stdin.readLineSync();
       var z=stdin.readLineSync();
       if(x!=null && y!=null && z!=null) {
         var l,m,n;
         l = convertDataType(x);
         m = convertDataType(y);
         n = convertDataType(z);
       }
    }while(flag=="y");
}