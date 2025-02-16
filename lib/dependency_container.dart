// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:rikin_interview_14_02/data/data_sources/remote/user_api_services.dart';
import 'package:rikin_interview_14_02/data/dio/dio_provider.dart';
import 'package:rikin_interview_14_02/data/repository/user_repository_impl.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';
import 'package:rikin_interview_14_02/presentation/cart_detail/cart_detail_cubit.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_cubit.dart';
import 'package:rikin_interview_14_02/presentation/product_detail/product_detail_cubit.dart';
import 'package:rikin_interview_14_02/presentation/user/login/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  getIt.registerSingleton<Dio>(DioProvider.httpDio);

// Data sources
  getIt.registerSingleton<UserApiServices>(UserApiServices(dio: getIt()));

// Repository
  getIt
      .registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));

  // Blocs
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(
        getIt(),
      ));
  getIt.registerFactory<ProductDetailCubit>(() => ProductDetailCubit(getIt()));
  getIt.registerFactory<CartDetailCubit>(() => CartDetailCubit());
}
