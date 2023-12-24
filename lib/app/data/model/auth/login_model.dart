import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel.fromJson(Map<String, dynamic> json)
      : super(
          responseCode: json['responseCode'],
          responseMessage: json['responseMessage'],
          responseSystemMessage: json['responseSystemMessage'],
          responseData: LoginResponseDataModel.fromJson(json['responseData'])
        );
}

class LoginResponseDataModel extends LoginResponseDataEntity {
  LoginResponseDataModel.fromJson(Map<String, dynamic> json)
      : super(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        staticToken: json["static_token"],
        isActive: json["is_active"],
        clientId: json["client_id"],
        clientSecret: json["client_secret"],
      );
}