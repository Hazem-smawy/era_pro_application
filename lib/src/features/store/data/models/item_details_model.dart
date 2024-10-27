import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';

// ignore: must_be_immutable
class ItemDetailsModel extends StoreItemDetailsEntity {
  ItemDetailsModel({
    required super.item,
    required super.group,
    required super.itemUnits,
    required super.itemUnitsDetails,
    required super.totalQuantityInStore,
  });

  // static List<StoreItemDetailsEntity> fromJsonArray(
  //     List<ItemDetailsModel> models) {
  //   return models.map((model) => model.toEntity()).toList();
  // }
}
