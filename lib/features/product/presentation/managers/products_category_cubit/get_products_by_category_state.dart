part of 'get_products_by_category_cubit.dart';

@immutable
sealed class GetProductsByCategoryState {}

final class GetProductsByCategoryInitial extends GetProductsByCategoryState {}
final class GetProductsByCategoryLoading extends GetProductsByCategoryState {}
final class GetProductsByCategorySuccess extends GetProductsByCategoryState {
  final List<ProductModel> products;
  GetProductsByCategorySuccess(this.products);
}

final class GetProductsCategoryFailure extends GetProductsByCategoryState {
  final String errorMessage;
  GetProductsCategoryFailure(this.errorMessage);
}
