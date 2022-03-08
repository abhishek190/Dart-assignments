enum CoursesType{
  A,B,C,D,E,F,G
}
extension ParseToString on CoursesType {
  String toShortString() {
    return toString().split('.').last;
  }
}