import 'package:bloc/bloc.dart';
import 'package:cartzy_app/core/utils/api_service.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/product/data/repos/category_repo.dart';
import 'package:meta/meta.dart';

part 'get_products_by_category_state.dart';

class GetProductsCategoryCubit extends Cubit<GetProductsByCategoryState> {
  GetProductsCategoryCubit(this.categoryRepo)
      : super(GetProductsByCategoryInitial());

  final CategoryRepo categoryRepo;

  Future<void> getProductsByCategory({required int id}) async
  {
    emit(GetProductsByCategoryLoading());
    var result = await categoryRepo.getProductsByCategory(id: id);

    result.fold((failure) =>
        emit(GetProductsCategoryFailure(failure.errorMessage)), (products) =>
        emit(GetProductsByCategorySuccess(products)));
  }
}
