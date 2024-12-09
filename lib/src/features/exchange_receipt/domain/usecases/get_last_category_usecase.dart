import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';

import '../../../../core/error/failures.dart';
import '../repositories/repositories.dart';

class GetLastCategoryUsecase extends ParamsUseCase<int, Params<int>> {
  ExchangeReceiptRepository receiptRepository;
  GetLastCategoryUsecase({
    required this.receiptRepository,
  });

  @override
  Future<Either<Failure, int>> call(Params params) async {
    return await receiptRepository.getLastId(params.data);
  }
}
