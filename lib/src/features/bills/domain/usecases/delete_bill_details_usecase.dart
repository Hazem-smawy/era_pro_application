import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

class DeleteBillDetailsUsecase extends ParamsUseCase<void, Params<int>> {
  BillsRepository billsRepository;

  DeleteBillDetailsUsecase({required this.billsRepository});
  @override
  Future<Either<Failure, int>> call(Params params) {
    return billsRepository.deleteBillDetails(params.data);
  }
}
