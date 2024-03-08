class ServerException implements Exception {
  final String message;
  ServerException(this.message) {
    // Log exception
    //print("ServerException: $message");
  }
}

