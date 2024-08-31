import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/image_converter.dart';

class BranchEntity extends Equatable {
  /*
  "id": 1,
    "company_id": 1,
    "name": "الرئيسي",
    "address": "إب",
    "phone": "77777",
    "email": "ERA@Gmail.com",
    "ar_report_header": "شركة إيرا تكنولوجي \r\nالعنوان : إب جولة العدين بجوار الاحوال المدنية\r\nالهاتف :777779380",
    "en_report_header": "Era Technology\r\nAddress : Ibb Aodin Street \r\nphone : 777773299",
  */
  final int id;
  @JsonKey(name: "company_id")
  final int companyId;
  final String name;
  final String? address;
  final String? phone;
  final String? email;
  @JsonKey(name: "ar_report_header")
  final String? arReportHeader;
  @JsonKey(name: "en_report_header")
  final String? enReportHeader;
  final String? note;

  @Uint8ListConverter()
  final Uint8List? logo;

  const BranchEntity({
    required this.id,
    required this.companyId,
    required this.name,
    this.address,
    this.phone,
    this.email,
    this.arReportHeader,
    this.enReportHeader,
    this.note,
    this.logo,
  });

  @override
  List<Object?> get props => [
        id,
        companyId,
        name,
        address,
        phone,
        email,
        logo,
        arReportHeader,
        enReportHeader
      ];
}
