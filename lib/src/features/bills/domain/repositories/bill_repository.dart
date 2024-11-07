import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_details_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';

abstract class BillsRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, int?>> addNewBill(BillEntity bill);
  Future<Either<Failure, bool>> addListofBillDetails(
      List<BillDetailsEntity> billDetails);
  Future<Either<Failure, int>> getLastId(int id);
}
