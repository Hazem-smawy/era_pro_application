import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/entities/barcode_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/repositories.dart';

class GetAllItemBarcodeUsecase extends NoParamUseCase<List<BarcodeEntity>> {
  StoreRepository storeRepository;

  GetAllItemBarcodeUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<BarcodeEntity>>> call() {
    return storeRepository.getAllItemBarcodes();
  }
}
