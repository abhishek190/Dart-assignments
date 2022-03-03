class ValueException implements Exception {

  late String _message;

  ValueException([String message = 'Invalid value']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}