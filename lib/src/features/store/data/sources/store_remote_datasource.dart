// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import '../models/models.dart';

abstract class StoreRemoteDatasource {
  Future<List<UnitModel>> getAllUnits();
  Future<List<ItemGroupModel>> getAllItemGroups();
  Future<List<ItemUnitsModel>> getAllItemUnit();

  Future<List<ItemModel>> getAllItems();
  
  //feature
  Future<List<ItemAlterModel>> getAllItemAlter();
  Future<List<BarcodeModel>> getAllBarcode();
}

class StoreRemoteDatasourceImp extends StoreRemoteDatasource {
  final ApiConnection apiConnection;
  final HttpMethod httpMethod;
  final SharedPreferencesService sharedPreferencesService;

  StoreRemoteDatasourceImp({
    required this.apiConnection,
    required this.httpMethod,
    required this.sharedPreferencesService,
  });

 



  @override
  Future<List<ItemGroupModel>> getAllItemGroups() async {
    return httpMethod.handleRequest<List<ItemGroupModel>>(
      apiConnection.itemGroupsUrl,
      (data) => ItemGroupModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<UnitModel>> getAllUnits() async {
    return httpMethod.handleRequest<List<UnitModel>>(
      apiConnection.unitsUrl,
      (data) => UnitModel.fromJsonArray(data),
    );
  }

  
  @override
  Future<List<ItemUnitsModel>> getAllItemUnit() async {
    return httpMethod.handleRequest<List<ItemUnitsModel>>(
      apiConnection.itemUnitsUrl,
      (data) => ItemUnitsModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<ItemModel>> getAllItems() {
    return httpMethod.handleRequest<List<ItemModel>>(apiConnection.itemsUrl,
        (data) {
      return ItemModel.fromJsonArray(data);
    });
  }

 


 

  @override
  Future<List<BarcodeModel>> getAllBarcode() {
    return httpMethod.handleRequest<List<BarcodeModel>>(
        apiConnection.itemBarcodesUrl,
        (data) => BarcodeModel.fromJsonArray(data));
  }

  @override
  Future<List<ItemAlterModel>> getAllItemAlter() {
    return httpMethod.handleRequest<List<ItemAlterModel>>(
      apiConnection.itemAlterUrl,
      (data) => ItemAlterModel.fromJsonArray(data),
    );
  }
}
