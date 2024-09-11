/*

     "id": 1,
        "code": 1,
        "name": "العصائر",
        "type": 0,
        "parent": 0,
        "note": "",
        "newData": true
*/

import 'package:equatable/equatable.dart';

class ItemGroupEntity extends Equatable {
  final int id;
  final int code;
  final String name;
  final int type;
  final int parent;
  final String note;
  final bool newData;

  const ItemGroupEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.parent,
    required this.note,
    required this.newData,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        type,
        parent,
        note,
        newData,
      ];
}
