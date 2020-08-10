class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    //Message is being sent
    return message;
  }
}