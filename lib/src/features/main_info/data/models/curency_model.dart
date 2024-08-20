import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'curency_model.g.dart';

@JsonSerializable()
class CurencyModel extends CurencyEntity {
  const CurencyModel(
      {required super.id,
      required super.name,
      required super.symbol,
      required super.subName,
      required super.value,
      required super.equivelant,
      required super.localCurrency,
      required super.storeCurrency,
      required super.maxValue,
      required super.minValue,
      required super.note,
      required super.newData});

  factory CurencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurencyModelToJson(this);

  static List<CurencyModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => CurencyModel.fromJson(value)).toList();
  }

  CurencyTableCompanion toCurencyTableComapnion() {
    return CurencyTableCompanion(
      id: Value(id),
      name: Value(name),
      subName: Value(subName),
      symbol: Value(symbol),
      value: Value(value),
      maxValue: Value(maxValue),
      minValue: Value(minValue),
      note: Value(note),
      newData: Value(newData),
      equivelant: Value(equivelant),
      localCurrency: Value(localCurrency),
      storeCurency: Value(storeCurrency),
    );
  }
}
