// To parse this JSON data, do
//
//     final howToFindUsModel = howToFindUsModelFromJson(jsonString);

import 'dart:convert';

HowToFindUsModel howToFindUsModelFromJson(String str) => HowToFindUsModel.fromJson(json.decode(str));

String howToFindUsModelToJson(HowToFindUsModel data) => json.encode(data.toJson());

class HowToFindUsModel {
  List<Datum>? data;

  HowToFindUsModel({
    this.data,
  });

  factory HowToFindUsModel.fromJson(Map<String, dynamic> json) => HowToFindUsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? referenceName;
  String? referenceValue;
  int? status;
  String? uploader;
  DateTime? createdAt;

  Datum({
    this.id,
    this.referenceName,
    this.referenceValue,
    this.status,
    this.uploader,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    referenceName: json["reference_name"],
    referenceValue: json["reference_value"],
    status: json["status"],
    uploader: json["uploader"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reference_name": referenceName,
    "reference_value": referenceValue,
    "status": status,
    "uploader": uploader,
    "created_at": createdAt?.toIso8601String(),
  };
}
