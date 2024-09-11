// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dartz/dartz.dart';

// import 'package:era_pro_application/src/core/error/failures.dart';
// import 'package:era_pro_application/src/core/usecases/usecases.dart';
// import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
// import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

// class GetItemDetailsUsecase extends ParamsUseCase<StoreItemDetailsEntity, int> {
//   StoreRepository storeRepository;
//   GetItemDetailsUsecase({
//     required this.storeRepository,
//   });
//   @override
//   Future<Either<Failure, StoreItemDetailsEntity>> call(params) {
//     return storeRepository.getItemDetails(params);
//   }
// }
