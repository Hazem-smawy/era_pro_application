// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

class GetLastIdUsecase extends ParamsUseCase<int, int> {
  BillsRepository billsRepository;
  GetLastIdUsecase({
    required this.billsRepository,
  });

  @override
  Future<Either<Failure, int>> call(int params) async {
    return billsRepository.getLastId(params);
  }
}
