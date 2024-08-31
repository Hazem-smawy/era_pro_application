import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/payment_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetAllPaymentsUsecase extends NoParamUseCase<List<PaymentEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllPaymentsUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<PaymentEntity>>> call() {
    return mainInfoRepository.getPaymentMethods();
  }
}
