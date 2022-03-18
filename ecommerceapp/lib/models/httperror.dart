class HttpError implements Exception {
  final String mess;
  HttpError(this.mess);

  @override
  String toString() {
    return mess;
  }
}
