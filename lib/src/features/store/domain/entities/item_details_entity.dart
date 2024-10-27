import 'package:equatable/equatable.dart';

import './store_entity.dart';

/*
class ItemDetails {
  final Item item;
  final Group group;
  final List<ItemUnitDetails> itemUnitDetails;

  ItemDetails({
    required this.item,
    required this.group,
    required this.itemUnitDetails,
  });
}

class ItemUnitDetails {
  final String unitName;
  final int quantity;
  final List<double> prices;

  ItemUnitDetails({
    required this.unitName,
    required this.quantity,
    required this.prices,
  });
}

*/
// ignore: must_be_immutable
class StoreItemDetailsEntity extends Equatable {
  int? id;
  final ItemEntity item;
  final int totalQuantityInStore;
  ItemGroupEntity? group;
  List<ItemUnitDetailsEntity> itemUnitsDetails;
  List<ItemAlterEntity>? itemAlter;
  List<ItemUnitsEntity>? itemUnits;

  StoreItemDetailsEntity({
    required this.item,
    required this.group,
    required this.itemUnits,
    required this.itemUnitsDetails,
    required this.totalQuantityInStore,
    this.itemAlter,
  });

  @override
  List<Object?> get props => [
        item,
        group,
        itemUnitsDetails,
        itemAlter,
        itemUnits,
      ];
}

class ItemUnitDetailsEntity {
  final String unitName;
  final int unitFactor;
  final int quantity;
  final List<double> prices;

  ItemUnitDetailsEntity({
    required this.unitName,
    required this.quantity,
    required this.prices,
    required this.unitFactor,
  });
}
