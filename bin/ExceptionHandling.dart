class ValueException implements Exception {
  String iOException()=>'Invalid input';
  String invalidNode() => 'Invalid Node';
  String invalidParentNode()=>'Invalid Parent Node';
  String inputRollNotFound() => 'Invalid Roll No';
  String childNodeNotFound()=>'Child Node not found';
  String parentNotFound()=>'Parent Node not found';
  String dependencyNotFound()=>'Dependencies not found';
}