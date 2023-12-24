import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/token_entities.dart';

class TokenModel extends TokenEntity {
  TokenModel.fromJson(Map<String, dynamic> json)
      : super(
          tokenType: json["token_type"],
          expiresIn: json["expires_in"],
          accessToken: json["access_token"],
          refreshToken: json["refresh_token"]
        );
}

class TokenFailedModel extends TokenFailedEntity {
  TokenFailedModel.fromJson(Map<String, dynamic> json)
      : super(
          error: json["error"],
          errorDescription: json["error_description"],
          message: json["message"],
        );
}