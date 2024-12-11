// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'dart:typed_data';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

class GetItemImageUsecase extends ParamsUseCase<Uint8List?, Params<int>> {
  StoreRepository storeRepository;
  GetItemImageUsecase({
    required this.storeRepository,
  });
  @override
  Future<Either<Failure, Uint8List?>> call(Params<int> params) {
    return storeRepository.getItemImage(params.data);
  }
}
