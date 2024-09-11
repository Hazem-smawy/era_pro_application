/*
        "id": 1,
        "item_id": 1,
        "item_alternative_id": 3,
        "item_order": 1
        */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ItemAlterEntity extends Equatable {
  final int id;
  @JsonKey(name: 'item_id')
  final int itemId;
  @JsonKey(name: 'item_alternative_id')
  final int itemAlterId;
  @JsonKey(name: 'item_order')
  final int itemOrder;

  const ItemAlterEntity({
    required this.id,
    required this.itemId,
    required this.itemAlterId,
    required this.itemOrder,
  });

  @override
  List<Object?> get props => [id, itemId, itemAlterId, itemOrder];
}
