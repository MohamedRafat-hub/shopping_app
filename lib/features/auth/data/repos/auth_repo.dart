import 'package:cartzy_app/core/errors/failure.dart';
import 'package:cartzy_app/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String avatar});

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
}
