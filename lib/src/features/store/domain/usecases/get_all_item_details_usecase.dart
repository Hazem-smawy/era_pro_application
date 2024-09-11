import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

class GetAllItemWithDetailsUsecase
    extends NoParamUseCase<List<StoreItemDetailsEntity>> {
  StoreRepository storeRepository;

  GetAllItemWithDetailsUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<StoreItemDetailsEntity>>> call() {
    return storeRepository.getAllItemsWithDetails();
  }
}
