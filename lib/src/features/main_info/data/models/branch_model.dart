import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/branch_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/image_converter.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class BranchModel extends BranchEntity {
  const BranchModel({
    required super.id,
    required super.companyId,
    required super.name,
    required super.address,
    required super.phone,
    required super.email,
    required super.arReportHeader,
    required super.enReportHeader,
    required super.note,
    required super.logo,
  });
  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);

  BranchEntity toEntity() {
    return BranchEntity(
        companyId: companyId,
        id: id,
        name: name,
        address: address,
        phone: phone,
        email: email,
        arReportHeader: arReportHeader,
        enReportHeader: enReportHeader,
        note: note,
        logo: logo);
  }

  BranchEntity toModel() {
    return BranchModel(
        companyId: companyId,
        id: id,
        name: name,
        address: address,
        phone: phone,
        email: email,
        arReportHeader: arReportHeader,
        enReportHeader: enReportHeader,
        note: note,
        logo: logo);
  }

  BranchTableCompanion toCompanion() {
    return BranchTableCompanion(
      id: Value(id),
      companyId: Value(companyId),
      name: Value(name),
      address: Value(address ?? ''),
      email: Value(email ?? ''),
      phone: Value(phone ?? ''),
      enReportHeader: Value(enReportHeader ?? ''),
      arReportHeader: Value(arReportHeader ?? ''),
      note: Value(note ?? ''),
      image: Value(logo ?? Uint8List(0)),
    );
  }
}
