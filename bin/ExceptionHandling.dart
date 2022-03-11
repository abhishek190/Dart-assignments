class ValueException implements Exception {
  String iOException()=>'Invalid input';
  String invalidNode() => 'Invalid Node';
  String invalidParentNode()=>'Invalid Parent Node';
  String inputRollNotFound() => 'Invalid Roll No';
  String childNodeNotFound()=>'Child Node not exist';
  String parentNotFound()=>'Parent Node not exist';
  String dependencyNotFound()=>'Dependencies not exist';
  String nodeExist()=>'Duplicate node found';
  String ancestorNotFound()=>'Ancestor not found';
  String descendantNotFound()=>'Descendant not found';
}