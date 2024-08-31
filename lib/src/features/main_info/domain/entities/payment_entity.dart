import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

/*
  "id": 1,
        "userid": 5,
        "methodname": "نقداً",
        "isdefault": true,
        "methodnote": "",
        "newData": true
 */
class PaymentEntity extends Equatable {
  final int id;
  @JsonKey(name: 'userid')
  final int userId;
  @JsonKey(name: 'methodname')
  final String methodName;
  @JsonKey(name: 'isdefault')
  final bool isDefault;
  @JsonKey(name: 'methodnote')
  final String methodNote;
  final bool newData;

  const PaymentEntity(
      {required this.isDefault,
      required this.methodNote,
      required this.id,
      required this.userId,
      required this.methodName,
      required this.newData});

  @override
  List<Object?> get props =>
      [id, userId, methodName, newData, methodNote, isDefault];
}
