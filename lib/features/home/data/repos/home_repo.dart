import 'package:cartzy_app/core/errors/failure.dart';
import 'package:cartzy_app/features/home/data/models/categories_model.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts();
  Future<Either<Failure, List<CategoriesModel>>> fetchAllCategories();
}
