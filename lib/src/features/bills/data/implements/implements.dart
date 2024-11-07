// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/bills/data/models/bill_details_model.dart';
import 'package:era_pro_application/src/features/bills/data/models/bill_model.dart';
import 'package:era_pro_application/src/features/bills/data/sources/bill_local_datasource.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_details_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

class BillRepositoryImp implements BillsRepository {
  BillLocalDatasource billLocalDatasource;
  BillRepositoryImp({
    required this.billLocalDatasource,
  });

  @override
  Future<Either<Failure, int?>> addNewBill(BillEntity bill) async {
    try {
      int? id =
          await billLocalDatasource.addNewBill(BillModel.fromEntity(bill));
      return Right(id);
    } catch (e) {
      return left(
          const LocalStorageFailures(message: ' add bill to database error'));
    }
  }

  @override
  Future<Either<Failure, int>> getLastId(int id) async {
    try {
      final lastId = await billLocalDatasource.getLastCategoryNumber(id);
      return Right(lastId);
    } catch (e) {
      return Left(LocalStorageFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addListofBillDetails(
      List<BillDetailsEntity> billDetails) async {
    try {
      await billLocalDatasource
          .addListofBillDetails(BillDetailsModel.fromEntityArray(billDetails));
      return const Right(true);
    } catch (e) {
      return Left(LocalStorageFailures(
          message: "can't added the billdetails:${e.toString()} "));
    }
  }
}
