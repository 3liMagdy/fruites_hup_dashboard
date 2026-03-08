


import 'package:fruits_hub_dashboard/core/repositories/image/image_repository.dart';
import 'package:fruits_hub_dashboard/core/repositories/image/image_repository_impl.dart';
import 'package:fruits_hub_dashboard/core/repositories/product/product_repository.dart';
import 'package:fruits_hub_dashboard/core/repositories/product/product_repository_impl.dart';
import 'package:fruits_hub_dashboard/core/services/SupabaseServiceProducts.dart';
import 'package:fruits_hub_dashboard/core/services/SupabaseStorageServiceImages.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service_Products.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service_images.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/mangers/add_product_cubit/add_product_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupGetIt() {

  /// Supabase Client
  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

  /// Product Service
  getIt.registerLazySingleton<StorageServiceProducts>(
    () => SupabaseServiceProducts(getIt<SupabaseClient>()),
  );

  /// Image Service
  getIt.registerLazySingleton<StorageServiceImages>(
    () => SupabaseStorageServiceImages(getIt<SupabaseClient>()),
  );

  /// Repositories
  getIt.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(getIt<StorageServiceImages>()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<StorageServiceProducts>()),
  );

  /// Cubit
  getIt.registerFactory<AddProductCubit>(
    () => AddProductCubit(
      getIt<ImageRepository>(),
      getIt<ProductRepository>(),
    ),
  );
}