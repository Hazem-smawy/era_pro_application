import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/company_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/image_converter.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.name,
    required super.enName,
    required super.shortName,
    required super.enShortName,
    required super.address,
    required super.website,
    required super.note,
    required super.logo,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  CompanyTableCompanion toCompanion() {
    return CompanyTableCompanion(
        id: Value(id),
        name: Value(name),
        enName: Value(enName),
        shortName: Value(shortName),
        enShortName: Value(enShortName),
        address: Value(address ?? ''),
        website: Value(website ?? ''),
        note: Value(note ?? ''),
        image: Value(logo ?? Uint8List(0)));
  }

  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id,
      name: name,
      enName: enName,
      shortName: shortName,
      enShortName: enShortName,
      address: address,
      website: website,
      note: note,
      logo: logo,
    );
  }
}
