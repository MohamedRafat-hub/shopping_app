import 'package:bloc/bloc.dart';
import 'package:cartzy_app/features/home/data/models/categories_model.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.homeRepo) : super(GetAllCategoriesInitial());
  final HomeRepo homeRepo;

  getAllCategories() async {
    emit(GetAllCategoriesLoading());
    var result = await homeRepo.fetchAllCategories();
    result.fold(
        (failure) => emit(GetAllCategoriesFailure(failure.errorMessage)),
        (categories) => emit(GetAllCategoriesSuccess(categories)));
  }
}
