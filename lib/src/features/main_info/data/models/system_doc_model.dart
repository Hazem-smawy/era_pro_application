import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/system_doc_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_doc_model.g.dart';

@JsonSerializable()
class SystemDocModel extends SystemDocEntity {
  const SystemDocModel({
    required super.id,
    required super.docName,
    required super.docType,
  });
  factory SystemDocModel.fromJson(Map<String, dynamic> json) =>
      _$SystemDocModelFromJson(json);

  Map<String, dynamic> toJson() => _$SystemDocModelToJson(this);

  static List<SystemDocModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => SystemDocModel.fromJson(value)).toList();
  }

  SystemDocTableCompanion toCompanion() {
    return SystemDocTableCompanion(
      id: Value(id),
      docName: Value(docName),
      docType: Value(docType),
    );
  }
}
