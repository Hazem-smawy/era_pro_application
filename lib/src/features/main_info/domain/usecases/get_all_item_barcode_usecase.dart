import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/barcode_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetAllItemBarcodeUsecase extends NoParamUseCase<List<BarcodeEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllItemBarcodeUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<BarcodeEntity>>> call() {
    return mainInfoRepository.getAllItemBarcodes();
  }
}