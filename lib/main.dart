import 'package:cartzy_app/core/utils/simple_bloc_observer.dart';
import 'package:cartzy_app/features/auth/presentation/views/login_view.dart';
import 'package:cartzy_app/features/auth/presentation/views/signup_view.dart';
import 'package:cartzy_app/features/cart/presentation/views/cart_view.dart';
import 'package:cartzy_app/features/home/data/repos/home_repo_impl.dart';
import 'package:cartzy_app/features/home/presentation/managers/get_all_products_Cubit/get_all_products_cubit.dart';
import 'package:cartzy_app/features/home/presentation/views/home_view.dart';
import 'package:cartzy_app/features/product/presentation/views/product_category_view.dart';
import 'package:cartzy_app/features/product/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/setup_service_locator.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
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
