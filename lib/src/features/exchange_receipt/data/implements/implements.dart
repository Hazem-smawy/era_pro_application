import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/exchange_receipt/data/models/exchange_model.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';

import '../sources/exhange_local_datasource.dart';
import '../../domain/repositories/repositories.dart';

class ExchangeReceiptRepositoryImp implements ExchangeReceiptRepository {
  final ExchangeLocalDatasource localDatasource;

  ExchangeReceiptRepositoryImp({required this.localDatasource});

  @override
  Future<Either<Failure, int>> saveExhangeReceipt(ExchangeEntity ex) async {
    try {
      int id = await localDatasource
          .saveOrUpdateExchange(ExchangeModel.fromEntity(ex));
      return Right(id);
    } catch (e) {
      return Left(LocalStorageFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExchangeEntity>>> getAllExchanges() async {
    try {
      List<ExchangeModel> list = await localDatasource.getAllExchange();

      return Right(list);
    } catch (e) {
      return Left(LocalStorageFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExchangeEntity?>> getExchangeById(int id) async {
    try {
      ExchangeModel? ex = await localDatasource.getExchangeById(id);

      return Right(ex);
    } catch (e) {
      return Left(LocalStorageFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getLastId(int type) async {
    try {
      int ex = await localDatasource.getLastCategoryNumber(type);

      return Right(ex);
    } catch (e) {
      return Left(LocalStorageFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllExchange() async {
    try {
      await localDatasource.deleteExchange();

      return const Right(true);
    } catch (e) {
      return Left(LocalStorageFailures(message: e.toString()));
    }
  }
}
