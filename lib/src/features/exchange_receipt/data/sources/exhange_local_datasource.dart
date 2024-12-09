import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/exchange_receipt/data/models/exchange_model.dart';

abstract class ExchangeLocalDatasource {
  Future<int> saveExchange(ExchangeModel item);

  Future<List<ExchangeModel>> getAllExchange();
  Future<ExchangeModel?> getExchangeById(int id);
  Future<int> getLastCategoryNumber(int type);
  Future<int> saveOrUpdateExchange(ExchangeModel item);
  Future<void> deleteExchange();
}

class ExhangeLocalDatasourceImp implements ExchangeLocalDatasource {
  @override
  Future<List<ExchangeModel>> getAllExchange() async {
    final db = AppDatabase.instance();

    // await db.delete(db.exchangesTable).go();
    // await db.delete(db.sandDetailsTable).go();
    // await db.delete(db.checkOperationsTable).go();
    final exchanges = await db.select(db.exchangesTable).get();
    final List<ExchangeModel> results = [];

    for (final exchange in exchanges) {
      final sandDetails = await (db.select(db.sandDetailsTable)
            ..where((tbl) => tbl.sandId.equals(exchange.id!)))
          .get();
      final checkOperations = await (db.select(db.checkOperationsTable)
            ..where((tbl) => tbl.sandId.equals(exchange.id!)))
          .get();

      results.add(
        ExchangeModel(
          id: exchange.id,
          sandType: exchange.sandType,
          isCash: exchange.isCash,
          branchId: exchange.branchId,
          sandNumber: exchange.sandNumber,
          sandDate: exchange.sandDate,
          fundNumber: exchange.fundNumber,
          currencyId: exchange.currencyId,
          currencyValue: exchange.currencyValue,
          reciepentName: exchange.reciepentName,
          totalAmount: exchange.totalAmount,
          sandNote: exchange.sandNote,
          refNumber: exchange.refNumber,
          sandDetails: sandDetails,
          checkOperations: checkOperations,
        ),
      );
    }

    return results;
  }

  @override
  Future<int> saveOrUpdateExchange(ExchangeModel item) async {
    final db = AppDatabase.instance();

    // Check if the record already exists by ID (assumes ExchangeModel has an id field)
    final existingExchange = await (db.select(db.exchangesTable)
          ..where((tbl) => tbl.id.equals(item.id ?? 0)))
        .getSingleOrNull();

    if (existingExchange != null) {
      // Update existing Exchange
      await (db.update(db.exchangesTable)
            ..where((tbl) => tbl.id.equals(item.id ?? 0)))
          .write(item.toCompanion());

      // Update Sand Details
      if (item.sandDetails != null && item.sandDetails!.isNotEmpty) {
        for (final detail in item.sandDetails!) {
          // Check if detail exists, update or insert accordingly
          final existingDetail = await (db.select(db.sandDetailsTable)
                ..where((tbl) => tbl.id.equals(detail.id!)))
              .getSingleOrNull();

          if (existingDetail != null) {
            // Update existing sand detail
            await (db.update(db.sandDetailsTable)
                  ..where((tbl) => tbl.id.equals(detail.id!)))
                .write(detail.toCompanion());
          } else {
            // Insert new sand detail
            detail.sandId = item.id!; // Use existing exchange ID
            await db.into(db.sandDetailsTable).insert(detail.toCompanion());
          }
        }
      }

      // Update Check Operations
      if (item.checkOperations != null && item.checkOperations!.isNotEmpty) {
        for (final operation in item.checkOperations!) {
          // Check if operation exists, update or insert accordingly
          final existingOperation = await (db.select(db.checkOperationsTable)
                ..where((tbl) => tbl.id.equals(operation.id!)))
              .getSingleOrNull();

          if (existingOperation != null) {
            // Update existing check operation
            await (db.update(db.checkOperationsTable)
                  ..where((tbl) => tbl.id.equals(operation.id!)))
                .write(operation.toCompanion());
          } else {
            // Insert new check operation
            operation.sandId = item.id!; // Use existing exchange ID
            await db
                .into(db.checkOperationsTable)
                .insert(operation.toCompanion());
          }
        }
      }

      return item.id!;
    } else {
      // Insert new Exchange
      return await saveExchange(item); // Reuse your existing save logic
    }
  }

  @override
  Future<int> saveExchange(ExchangeModel item) async {
    final db = AppDatabase.instance();

    // Insert Exchange
    final exchangeId =
        await db.into(db.exchangesTable).insert(item.toCompanion());

    // Insert Sand Details
    var sandDetails = item.sandDetails;

    if (sandDetails != null && sandDetails.isNotEmpty) {
      for (final detail in sandDetails) {
        detail.sandId = exchangeId;
        await db.into(db.sandDetailsTable).insert(detail.toCompanion());
      }
    }

    // Update sandId in Check Operations
    final checkOperations = item.checkOperations;
    if (checkOperations != null && checkOperations.isNotEmpty) {
      for (final operation in checkOperations) {
        operation.sandId = exchangeId; // Update sandId
        await db.into(db.checkOperationsTable).insert(operation.toCompanion());
      }
    }

    return exchangeId;
  }

  @override
  Future<ExchangeModel?> getExchangeById(int id) async {
    final db = AppDatabase.instance();

    // Fetch the exchange by ID
    final exchange = await (db.select(db.exchangesTable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();

    // If no exchange is found, return null
    if (exchange == null) {
      return null;
    }

    // Fetch related sandDetails
    final sandDetails = await (db.select(db.sandDetailsTable)
          ..where((tbl) => tbl.sandId.equals(exchange.id!)))
        .get();

    // Fetch related checkOperations
    final checkOperations = await (db.select(db.checkOperationsTable)
          ..where((tbl) => tbl.sandId.equals(exchange.id!)))
        .get();

    // Map the fetched data into an ExchangeModel
    return ExchangeModel(
        id: exchange.id,
        sandType: exchange.sandType,
        isCash: exchange.isCash,
        branchId: exchange.branchId,
        sandNumber: exchange.sandNumber,
        sandDate: exchange.sandDate,
        fundNumber: exchange.fundNumber,
        currencyId: exchange.currencyId,
        currencyValue: exchange.currencyValue,
        reciepentName: exchange.reciepentName,
        totalAmount: exchange.totalAmount,
        sandNote: exchange.sandNote,
        refNumber: exchange.refNumber,
        sandDetails: sandDetails,
        checkOperations: checkOperations);
  }

  @override
  Future<int> getLastCategoryNumber(int type) async {
    final db = AppDatabase.instance();

    final lastNumber = await (db.select(db.exchangesTable)
          ..where((tbl) => tbl.sandType.equals(type))
          ..orderBy([
            (tbl) => OrderingTerm(
                expression: tbl.sandNumber, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .map((row) => row.sandNumber)
        .getSingleOrNull();

    return lastNumber ??
        0; // Returns null if no rows are found, otherwise the last number
  }

  @override
  Future<void> deleteExchange() async {
    final db = AppDatabase.instance();
    db.delete(db.exchangesTable);
    db.delete(db.sandDetailsTable);
    db.delete(db.checkOperationsTable);
  }
}

// class ExchangeLocalDatasource {
//   final AppDatabase _db;

//   ExchangeLocalDatasource(this._db);

//   Future<int> insertExchange(ExchangeEntity entity) async {
//     // Insert Exchange
//     final exchangeId = await _db.into(_db.exchanges).insert(entity.toDriftExchange().toCompanion(false));

//     // Insert Sand Details
//     final sandDetails = entity.toDriftSandDetails();
//     for (final detail in sandDetails) {
//       await _db.into(_db.sandDetails).insert(detail.toCompanion(false));
//     }

//     // Insert Check Operations
//     final checkOperations = entity.toDriftCheckOperations();
//     for (final operation in checkOperations) {
//       await _db.into(_db.checkOperations).insert(operation.toCompanion(false));
//     }

//     return exchangeId;
//   }

//   Future<List<ExchangeEntity>> fetchAllExchanges() async {
//     final exchanges = await _db.select(_db.exchanges).get();
//     final List<ExchangeEntity> results = [];

//     for (final exchange in exchanges) {
//       final sandDetails = await (_db.select(_db.sandDetails)..where((tbl) => tbl.sandId.equals(exchange.id))).get();
//       final checkOperations = await (_db.select(_db.checkOperations)..where((tbl) => tbl.sandId.equals(exchange.id))).get();

//       results.add(
//         ExchangeEntity(
//           id: exchange.id,
//           sandType: exchange.sandType,
//           isCash: exchange.isCash,
//           branchId: exchange.branchId,
//           sandNumber: exchange.sandNumber,
//           sandDate: exchange.sandDate,
//           fundNumber: exchange.fundNumber,
//           currencyId: exchange.currencyId,
//           currencyValue: exchange.currencyValue,
//           reciepentName: exchange.reciepentName,
//           totalAmount: exchange.totalAmount,
//           sandNote: exchange.sandNote,
//           refNumber: exchange.refNumber,
//           sandDetails: sandDetails,
//           checkOperations: checkOperations,
//         ),
//       );
//     }

//     return results;
//   }
// }

// import 'package:drift/drift.dart';
// import 'app_database.dart';

// class ExchangeLocalDatasource {
//   final AppDatabase _db;

//   ExchangeLocalDatasource(this._db);

//   /// Insert a new exchange
//   Future<int> insertExchange(ExchangesCompanion exchange) async {
//     return await _db.into(_db.exchanges).insert(exchange);
//   }

//   /// Insert a sand detail
//   Future<int> insertSandDetail(SandDetailsCompanion sandDetail) async {
//     return await _db.into(_db.sandDetails).insert(sandDetail);
//   }

//   /// Insert a check operation
//   Future<int> insertCheckOperation(CheckOperationsCompanion checkOperation) async {
//     return await _db.into(_db.checkOperations).insert(checkOperation);
//   }

//   /// Fetch all exchanges
//   Future<List<Exchange>> getAllExchanges() async {
//     return await _db.select(_db.exchanges).get();
//   }

//   /// Fetch an exchange by ID
//   Future<Exchange?> getExchangeById(int id) async {
//     return await (_db.select(_db.exchanges)..where((tbl) => tbl.id.equals(id)))
//         .getSingleOrNull();
//   }

//   /// Fetch all sand details for an exchange
//   Future<List<SandDetail>> getSandDetailsByExchangeId(int exchangeId) async {
//     return await (_db.select(_db.sandDetails)
//           ..where((tbl) => tbl.sandId.equals(exchangeId)))
//         .get();
//   }

//   /// Fetch all check operations for an exchange
//   Future<List<CheckOperationModel>> getCheckOperationsByExchangeId(int exchangeId) async {
//     return await (_db.select(_db.checkOperations)
//           ..where((tbl) => tbl.sandId.equals(exchangeId)))
//         .get();
//   }

//   /// Update an exchange
//   Future<bool> updateExchange(ExchangeModel exchange) async {
//     return await (_db.update(_db.exchanges)..where((tbl) => tbl.id.equals(exchange.id)))
//         .replace(exchange);
//   }

//   /// Delete an exchange
//   Future<int> deleteExchangeById(int id) async {
//     return await (_db.delete(_db.exchanges)..where((tbl) => tbl.id.equals(id))).go();
//   }

//   /// Delete all sand details for an exchange
//   Future<int> deleteSandDetailsByExchangeId(int exchangeId) async {
//     return await (_db.delete(_db.sandDetails)..where((tbl) => tbl.sandId.equals(exchangeId))).go();
//   }

//   /// Delete all check operations for an exchange
//   Future<int> deleteCheckOperationsByExchangeId(int exchangeId) async {
//     return await (_db.delete(_db.checkOperations)..where((tbl) => tbl.sandId.equals(exchangeId))).go();
//   }

//   /// Fetch an exchange with all its details
//   Future<ExchangeWithDetails?> getExchangeWithDetails(int exchangeId) async {
//     final exchange = await getExchangeById(exchangeId);
//     if (exchange == null) return null;

//     final sandDetails = await getSandDetailsByExchangeId(exchangeId);
//     final checkOperations = await getCheckOperationsByExchangeId(exchangeId);

//     return ExchangeWithDetails(
//       exchange: exchange,
//       sandDetails: sandDetails,
//       checkOperations: checkOperations,
//     );
//   }
// }

// /// Helper class to hold an Exchange with its related details
// class ExchangeWithDetails {
//   final ExchangeModel exchange;
//   final List<SandDetailModel> sandDetails;
//   final List<CheckOperationModel> checkOperations;

//   ExchangeWithDetails({
//     required this.exchange,
//     required this.sandDetails,
//     required this.checkOperations,
//   });
// }
