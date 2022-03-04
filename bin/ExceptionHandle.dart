class InvalidInputException implements Exception {

  late String _message;

  InvalidInputException([String message = 'Invalid value']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}