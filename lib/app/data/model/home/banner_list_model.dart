import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/home/banner_list_entity.dart';

class BannerListModel extends BannerListEntity {
  BannerListModel.fromJson(Map<String, dynamic> json)
      : super(
          responseCode: json['responseCode'],
          responseMessage: json['responseMessage'],
          responseSystemMessage: json['responseSystemMessage'],
          responseData: List<BannerListResponseDataEntity>.from(
            json['responseData'].map((x) =>
              BannerListResponseDataModel.fromJson(json['responseData'])
            )
          )
        );
}

class BannerListResponseDataModel extends BannerListResponseDataEntity {
  BannerListResponseDataModel.fromJson(Map<String, dynamic> json)
      : super(
          bannerName: json["banner_name"],
          bannerImage: json["banner_image"],
          isActive: json["is_active"]
        );
}