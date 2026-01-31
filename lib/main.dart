import 'package:cartzy_app/core/constants.dart';
import 'package:cartzy_app/core/utils/simple_bloc_observer.dart';
import 'package:cartzy_app/features/auth/presentation/views/account_view.dart';
import 'package:cartzy_app/features/auth/presentation/views/login_view.dart';
import 'package:cartzy_app/features/auth/presentation/views/signup_view.dart';
import 'package:cartzy_app/features/cart/presentation/views/cart_view.dart';
import 'package:cartzy_app/features/favourite/presentation/views/favourite_view.dart';
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/home/data/repos/home_repo_impl.dart';
import 'package:cartzy_app/features/home/presentation/managers/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:cartzy_app/features/home/presentation/managers/get_all_products_Cubit/get_all_products_cubit.dart';
import 'package:cartzy_app/features/home/presentation/views/home_view.dart';
import 'package:cartzy_app/features/product/data/repos/category_repo_impl.dart';
import 'package:cartzy_app/features/product/presentation/managers/products_category_cubit/get_products_by_category_cubit.dart';
import 'package:cartzy_app/features/product/presentation/views/product_category_view.dart';
import 'package:cartzy_app/features/product/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/setup_service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(KFavouritesBox);
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllProductsCubit>(create: (context) {
          return GetAllProductsCubit(getIt<HomeRepoImpl>())..fetchAllProducts();
        }),
        BlocProvider(create: (context) {
          return GetAllCategoriesCubit(getIt<HomeRepoImpl>())
            ..getAllCategories();
        }),
        BlocProvider(create: (context) {
          return GetProductsCategoryCubit(getIt<CategoryRepoImpl>());
        }),
      ],
      child: MaterialApp(
        initialRoute: HomeView.id,
        routes: {
          ProductCategoryView.id: (context) => ProductCategoryView(),
          HomeView.id: (context) => HomeView(),
          SignupView.id: (context) => SignupView(),
          LoginView.id: (context) => LoginView(),
          ProductDetailsView.id: (context) => ProductDetailsView(),
          CartView.id: (context) => CartView(),
          FavouriteView.id: (context) => FavouriteView(),
          AccountView.id : (context) =>AccountView(),
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFEBEBEB),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          scaffoldBackgroundColor: Color(0xFFEBEBEB),
        ),
      ),
    );
  }
}
