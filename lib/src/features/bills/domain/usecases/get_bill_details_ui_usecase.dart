// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_ui_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

class GetBillDetailsUIUsecase
    extends ParamsUseCase<List<BillDetailsUI>, Params<int>> {
  BillsRepository billsRepository;
  GetBillDetailsUIUsecase({
    required this.billsRepository,
  });

  @override
  Future<Either<Failure, List<BillDetailsUI>>> call(Params<int> params) async {
    return billsRepository.getBillDetailsUI(params.data);
  }
}
