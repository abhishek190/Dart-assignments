enum CoursesType{
  A,B,C,D,E,F,G
}
enum SortName{
  name,roll,address,age
}
extension ParseToString on CoursesType {
  String toShortString() {
    return toString().split('.').last;
  }
}
extension SortNameParseToString on SortName{
  String toShortString() {
    return toString().split('.').last;
  }
}
extension DataTypeExtension on SortName {

  dynamic get value {
    switch (this) {
      case SortName.name:
        return 1;
      case SortName.roll:
        return 2;
      case SortName.age:
        return 3;
      case SortName.address:
        return 4;
    }
  }
}