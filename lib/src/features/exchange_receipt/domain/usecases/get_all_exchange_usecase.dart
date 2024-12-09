import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';

import '../../../../core/error/failures.dart';
import '../repositories/repositories.dart';

class GetAllExchangeUsecase extends NoParamUseCase<List<ExchangeEntity>> {
  ExchangeReceiptRepository receiptRepository;
  GetAllExchangeUsecase({
    required this.receiptRepository,
  });

  @override
  Future<Either<Failure, List<ExchangeEntity>>> call() async {
    return await receiptRepository.getAllExchanges();
  }
}
