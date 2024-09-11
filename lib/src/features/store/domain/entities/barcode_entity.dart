/* 
       "id": 1,
        "item_id": 1,
        "item_barcode": "334"
*/

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class BarcodeEntity extends Equatable {
  final int id;
  @JsonKey(name: 'item_id')
  final int itemId;
  @JsonKey(name: 'item_barcode')
  final String itemBarcode;

  const BarcodeEntity({
    required this.id,
    required this.itemId,
    required this.itemBarcode,
  });

  @override
  List<Object?> get props => [
        id,
        itemId,
        itemBarcode,
      ];
}
