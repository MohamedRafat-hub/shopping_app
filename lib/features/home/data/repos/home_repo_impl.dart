import 'package:cartzy_app/core/errors/failure.dart';
import 'package:cartzy_app/core/utils/api_service.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo
{
  final ApiService apiService;
  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts()async {
    try {
      var data = await apiService.get(endPoint: 'products/');  // List<ProductModel>
      List<ProductModel>products = [];

      for(var item in data)
        {
          products.add(ProductModel.fromJson(item));
        }

      // final productsList = data.map((item) => ProductModel.fromJson(item)).toList();
      return right(products);
    } on Exception catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}