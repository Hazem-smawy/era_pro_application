import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';
import '../../domain/entities/check_operation_entity.dart';

part 'check_operation_model.g.dart';

@JsonSerializable()
class CheckOperationModel extends CheckOperationEntity {
  CheckOperationModel({
    super.id,
    required super.sandId,
    required super.operationNumber,
    required super.operationDate,
    required super.paymentMethed,
    required super.operationState,
  });

  factory CheckOperationModel.fromJson(Map<String, dynamic> json) =>
      _$CheckOperationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckOperationModelToJson(this);

  static CheckOperationModel fromEntity(CheckOperationEntity entity) {
    return CheckOperationModel(
      id: entity.id,
      sandId: entity.sandId,
      operationNumber: entity.operationNumber,
      operationDate: entity.operationDate,
      paymentMethed: entity.paymentMethed,
      operationState: entity.operationState,
    );
  }
}
