enum Type { raw, manufactured, imported }

extension ParseToString on Type {
  String toShortString() {
    return toString().split('.').last;
  }
}

enum checkType{
  double,
  int,
  string
}

extension DataTypeExtension on checkType {

  dynamic get type {
    switch (this) {
      case checkType.double:
        return "double";
      case checkType.int:
        return "int";
      case checkType.string:
        return "String";
      default:
        return null;
    }
  }

  dynamic get value {
    switch (this) {
      case checkType.double:
        return 0.0;
      case checkType.int:
        return 0;
      case checkType.string:
        return "";
      default:
        return null;
    }
  }
}