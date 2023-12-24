class TokenEntity {
  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;

  TokenEntity({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });
}

class TokenFailedEntity {
  String error;
  String errorDescription;
  String message;

  TokenFailedEntity({
    required this.error,
    required this.errorDescription,
    required this.message,
  });
}