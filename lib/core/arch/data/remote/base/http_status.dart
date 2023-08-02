class HttpStatus {
  static const int kCodeSuccess200 = 200;
  static const int kCodeSuccess201 = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int unprocessedEntity = 422;
  static const int unsupportedMediaType = 415;
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;

  static const int networkConnectTimeoutError = 599;
  static const int tooManyRequests = 429;
}
