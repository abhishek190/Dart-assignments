import 'dart:collection';
import '../bin/enum.dart';
//Check variable integer or not
bool checkInt(var temp) {
  if ((int.tryParse(temp)).toString() == temp) {
    return true;
  } else {
    return false;
  }
}

//Convert datatype of input
dynamic convertDataType(var x) {
  if (double.tryParse(x) != null) {
    //Check input is numeric or string
    return checkInt(x)
        ? int.tryParse(x)
        : double.tryParse(x); //check input is integer or double
  } else {
    return x.toLowerCase();
  }
}

//Datatype assign
dynamic typeAssign(dynamic check,var l,var m, var n,dynamic initialValue){
  return l.runtimeType.toString() == check
      ? l
      : (m.runtimeType.toString() == check
      ? m
      : (n.runtimeType.toString() == check ? n : initialValue));
}


//Check Input is valid or not
bool checkInputValidation(var name, var x, var y, var z) {
  if (name.length == 0) {
    return false;
  }
  HashMap mp = HashMap<dynamic,dynamic>();

  //key is dataType of variable and value is variable
  mp[x.runtimeType] = x;
  mp[y.runtimeType] = y;
  mp[z.runtimeType] = z;

  //if size of key is not equal to 3 means duplicate key is present
  if (mp.length != 3) {
    return false;
  } else {
    bool result = true;
    mp.forEach((key, value) {
      if (key == double || key == String || key == int) {
        //checking key other then double , String , int
        if (key == String) {
          var type = value.toLowerCase();

          if (type == Type.raw.toShortString()|| type == Type.manufactured.toShortString() || type == Type.imported.toShortString()) {
            //checking key as String its value must be raw , manufactured , imported
            result = true;
          } else {
            result = false;
          }
        }
      } else {
        result = false;
      }
    });
    return result;
  }
}