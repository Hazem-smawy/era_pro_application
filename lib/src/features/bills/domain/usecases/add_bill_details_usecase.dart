// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_details_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

class AddBillDetailsUsecase
    extends ParamsUseCase<bool, List<BillDetailsEntity>> {
  BillsRepository billsRepository;
  AddBillDetailsUsecase({
    required this.billsRepository,
  });

  @override
  Future<Either<Failure, bool>> call(List<BillDetailsEntity> params) async {
    return billsRepository.addListofBillDetails(params);
  }
}
