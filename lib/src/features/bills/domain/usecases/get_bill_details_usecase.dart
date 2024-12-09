// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_details_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

class GetBillDetailsUsecase
    extends ParamsUseCase<List<BillDetailsEntity>, Params<int>> {
  BillsRepository billsRepository;
  GetBillDetailsUsecase({
    required this.billsRepository,
  });

  @override
  Future<Either<Failure, List<BillDetailsEntity>>> call(
      Params<int> params) async {
    return billsRepository.getAllDetailsForBill(params.data);
  }
}
