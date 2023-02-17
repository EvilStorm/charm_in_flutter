class AppException implements Exception {
  final String message;
  final String prefix;
  final Exception? e;

  AppException(
    this.message,
    this.prefix, {
    this.e,
  });

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class FatalException extends AppException {
  FatalException([message, e]) : super(message, "Error! : ", e: e);
}

class FetchDataException extends AppException {
  FetchDataException([message, e])
      : super(message, "Error During Communication: ", e: e);
}

class FetchInnerException extends AppException {
  FetchInnerException([message, e])
      : super(message, "Sended ErrorCode: ", e: e);
}

class NotNormalException extends AppException {
  NotNormalException([message, e]) : super(message, "Invalid Request: ", e: e);
}

class ServerException extends AppException {
  ServerException([message, e]) : super(message, "Server Exception: ", e: e);
}

class BadRequestException extends AppException {
  BadRequestException([message, e]) : super(message, "Invalid Request: ", e: e);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message, e]) : super(message, "Unauthorised: ", e: e);
}

class InvalidInputException extends AppException {
  InvalidInputException([message, e]) : super(message, "Invalid Input: ", e: e);
}

class UnExpectedException extends AppException {
  UnExpectedException([message, e])
      : super(message, "UnExpectedException: ", e: e);
}
