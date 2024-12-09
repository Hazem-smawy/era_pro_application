/*
        "id": 11,
        "accTag": 1,
        "accName": "حساب المخزون",
        "accNumber": 122010002

*/

import 'package:equatable/equatable.dart';

class RefAccountEntity extends Equatable {
  final int id;
  final int accTag;
  final String accName;
  final int accNumber;

  const RefAccountEntity(this.id, this.accTag, this.accName, this.accNumber);

  @override
  List<Object?> get props => [id, accTag, accName, accNumber];
}
