void main() {
  try {
    throw MyCustomException('this is CustomException');
    //throw here
  }on  MyCustomException catch (e) {
    print(e);
  }
}

class MyCustomException implements Exception {
  final String message;

  MyCustomException(this.message);

  @override
  String toString() {
    return 'MyCustomException: $message';
  }
}