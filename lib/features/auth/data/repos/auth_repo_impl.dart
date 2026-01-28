import 'package:cartzy_app/core/errors/failure.dart';
import 'package:cartzy_app/core/utils/api_service.dart';
import 'package:cartzy_app/features/auth/data/models/user_model.dart';
import 'package:cartzy_app/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String avatar}) async {
    try {
      var data = await apiService.post(endPoint: 'users/', data: {
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatar
      });
      return right(UserModel.fromJson(data));
    } on Exception catch (e) {
      if(e is DioException)
        {
          return left(ServerFailure.fromDioError(e));
        }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password})async {
    try {
      var data = await apiService.post(
          endPoint: 'auth/login', data: {'email': email, 'password': password});

      return right(UserModel.fromJson(data));
    } on Exception catch (e) {
      if(e is DioException)
        {
          return left(ServerFailure.fromDioError(e));
        }
      return left(ServerFailure(e.toString()));
    }
  }
}
