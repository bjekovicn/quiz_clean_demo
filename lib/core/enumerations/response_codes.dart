enum ResponseCode {
  success(200), // success with data
  noContent(201), // success with no data (no content)
  badRequest(400), // failure, API rejected request
  unauthorized(401), // failure, user is not authorized
  forbidden(403), // failure, API rejected request
  internalServerError(500), // failure, crash in server side
  notFound(404), // failure, not found
  invalidData(422), // failure, invalid data

  // Local status codes
  connectTimeout(-1), // local status code
  cancel(-2), // local status code
  receiveTimeout(-3), // local status code
  sendTimeout(-4), // local status code
  cacheError(-5), // local status code
  noInternetConnection(-6), // local status code
  locationDenied(-7), // local status code
  defaultError(-8), // local status code
  connectionError(-9); // local status code

  final int code; // associated integer value

  const ResponseCode(this.code);

  int get value => code;

  static ResponseCode fromStatusCode(int statusCode) {
    return ResponseCode.values.firstWhere(
      (code) => code.value == statusCode,
      orElse: () => ResponseCode.defaultError,
    );
  }
}
