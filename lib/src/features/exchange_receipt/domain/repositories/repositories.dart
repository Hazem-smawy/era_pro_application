import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';

abstract class ExchangeReceiptRepository {
  Future<Either<Failure, int>> saveExhangeReceipt(ExchangeEntity ex);
  Future<Either<Failure, List<ExchangeEntity>>> getAllExchanges();
  Future<Either<Failure, ExchangeEntity?>> getExchangeById(int id);
  Future<Either<Failure, int>> getLastId(int id);
  Future<Either<Failure, bool>> deleteAllExchange();
}
