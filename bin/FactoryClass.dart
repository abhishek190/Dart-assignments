import 'Enum.dart';
import '../bin/Raw.dart';
import '../bin/Manufactured.dart';
import '../bin/Imported.dart';
class FactoryClass {
   itemFactory(Type type,String name,double prize,int quantity,String type1){
    switch(type){
      case Type.raw:return Raw(name,  prize,quantity, type1);
      case Type.manufactured:return Manufactured(name,  prize,quantity, type1);
      case Type.imported:return Imported(name,  prize,quantity, type1);
    }
  }
}


