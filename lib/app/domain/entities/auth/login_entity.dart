class LoginEntity{
  bool responseCode;
  String responseMessage;
  String responseSystemMessage;
  LoginResponseDataEntity responseData;

  LoginEntity({
    required this.responseCode,
    required this.responseMessage,
    required this.responseSystemMessage,
    required this.responseData,
  });
}

class LoginResponseDataEntity {
  int id;
  String email;
  String name;
  String staticToken;
  bool isActive;
  String clientId;
  String clientSecret;

  LoginResponseDataEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.staticToken,
    required this.isActive,
    required this.clientId,
    required this.clientSecret,
  });
}