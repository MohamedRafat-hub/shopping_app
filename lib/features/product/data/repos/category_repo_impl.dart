import 'package:cartzy_app/core/errors/failure.dart';
import 'package:cartzy_app/core/utils/api_service.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/product/data/repos/category_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepoImpl extends CategoryRepo {
  final ApiService apiService;

  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory({required int id}) async {
    try {
      var data = await apiService.getProductByCategory(endPoint: 'categories/1/products?', id: id);

      List<ProductModel> products =
          data.map((item) => ProductModel.fromJson(item)).toList();

      return right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
