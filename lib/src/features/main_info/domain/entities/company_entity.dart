// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:typed_data';
import '../../../../core/utils/image_converter.dart';

class CompanyEntity extends Equatable {
  /*
   "id": 1,
    "name": "إيرا تكنولوجي",
    "en_name": "Era Technology",
    "short_name": "إيرا",
    "short_en_name": "ERA",
    "website": "www.ERA.com",
    "address": "اليمن إب",
    "note": "لا يوجد",
   */
  final int id;
  final String name;
  @JsonKey(name: "en_name")
  final String enName;
  @JsonKey(name: "short_name")
  final String shortName;
  @JsonKey(name: "short_en_name")
  final String enShortName;
  @Uint8ListConverter()
  final Uint8List? logo;
  final String? address;
  final String? website;

  final String? note;
  const CompanyEntity({
    required this.id,
    required this.name,
    required this.enName,
    required this.shortName,
    required this.enShortName,
    this.address,
    this.website,
    this.note,
    this.logo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        enName,
        shortName,
        enShortName,
        address,
        website,
        logo,
        note,
      ];
}
