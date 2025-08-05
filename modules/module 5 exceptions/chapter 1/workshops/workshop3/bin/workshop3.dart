void main() {
  try {
    //throw here
  } catch (e) {
    print(e);
  }
}class MyCustomException implements Exception {
  final String message;

  MyCustomException(this.message);

  @override
  String toString() {
    return 'MyCustomException: $message';
  }
}