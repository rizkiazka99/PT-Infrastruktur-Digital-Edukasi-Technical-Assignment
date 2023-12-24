class BannerListEntity {
  bool responseCode;
  String responseMessage;
  String responseSystemMessage;
  List<BannerListResponseDataEntity> responseData;

  BannerListEntity({
    required this.responseCode,
    required this.responseMessage,
    required this.responseSystemMessage,
    required this.responseData,
  });
}

class BannerListResponseDataEntity {
  String bannerName;
  String bannerImage;
  bool isActive;

  BannerListResponseDataEntity({
    required this.bannerName,
    required this.bannerImage,
    required this.isActive,
  });
}