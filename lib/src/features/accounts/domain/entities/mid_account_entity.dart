// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
        "id": 1,
        "accTag": 1,
        "accName": "حساب الشيكات الصادره",
        "accNumber": 224030001,
        "branchId": 0
*/
import 'package:equatable/equatable.dart';

class MidAccountEntity extends Equatable {
  final int id;
  final int accTag;
  final String accName;
  final int accNumber;
  final int branchId;
  const MidAccountEntity({
    required this.id,
    required this.accTag,
    required this.accName,
    required this.accNumber,
    required this.branchId,
  });
  @override
  List<Object?> get props => [
        id,
        accTag,
        accName,
        accNumber,
        branchId,
      ];
}
