import 'package:cartzy_app/core/errors/failure.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepo
{
  Future<Either<Failure , List<ProductModel>>>getProductsByCategory({required int id});
}