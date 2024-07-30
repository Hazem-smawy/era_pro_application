// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:era_pro_applicationlication/src/features/auth/data/models/auth_response_model.dart';
import 'package:era_pro_applicationlication/src/features/auth/data/sources/auth_remoteDatasource.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/repositories/repositories.dart';
import '../../../../core/error/error.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRemoteDatasource remoteDatasource;
  AuthRepositoryImp({
    required this.remoteDatasource,
  });
  @override
  Future<Either<Failure, AuthResponseModel>> auth(
      {required username, required password}) async {
    try {
      final auth =
          await remoteDatasource.auth(username: username, password: password);

      return Right(auth);
    } on ServerExeption {
      return const Left(ServerFailures(message: "servier message"));
    } on TimeoutException {
      return const Left(ServerFailures(message: "time out  message"));
    } catch (e) {
      return Left(ServerFailures(message: "other message : $e"));
    }
  }
}
