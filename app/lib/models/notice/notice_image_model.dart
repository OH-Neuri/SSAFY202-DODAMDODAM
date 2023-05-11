import 'dart:convert';

NoticeImageModel noticeImageModelFromJson(String str) => NoticeImageModel.fromJson(json.decode(str));

String noticeImageModelToJson(NoticeImageModel data) => json.encode(data.toJson());

class NoticeImageModel {
  List<Image> images;

  NoticeImageModel({
    required this.images,
  });

  factory NoticeImageModel.fromJson(Map<String, dynamic> json) => NoticeImageModel(
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  int noticePhotoSeq;
  String url;

  Image({
    required this.noticePhotoSeq,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    noticePhotoSeq: json["noticePhotoSeq"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "noticePhotoSeq": noticePhotoSeq,
    "url": url,
  };
}