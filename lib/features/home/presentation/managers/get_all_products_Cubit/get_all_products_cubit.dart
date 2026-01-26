import 'package:bloc/bloc.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this.homeRepo) : super(GetAllProductsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchAllProducts() async {
    emit(GetAllProductsLoading());
    var result = await homeRepo.fetchAllProducts();
    result.fold(
      (failure) =>
          emit(GetAllProductsFailure(errorMessage: failure.errorMessage)),
      (products) => emit(GetAllProductsSuccess(products: products)),
    );
  }
}
