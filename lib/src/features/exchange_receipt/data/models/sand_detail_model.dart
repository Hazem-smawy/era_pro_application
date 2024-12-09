import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/sand_details_entity.dart';

part 'sand_detail_model.g.dart';

@JsonSerializable()
class SandDetailModel extends SandDetailEntity {
  SandDetailModel({
    super.id,
    required super.sandId,
    required super.accNumber,
    required super.amount,
    required super.currencyId,
    required super.currencyValue,
  });

  factory SandDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SandDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SandDetailModelToJson(this);

  static SandDetailModel fromEntity(SandDetailEntity entity) {
    return SandDetailModel(
      id: entity.id,
      sandId: entity.sandId,
      accNumber: entity.accNumber,
      amount: entity.amount,
      currencyId: entity.currencyId,
      currencyValue: entity.currencyValue,
    );
  }
}
