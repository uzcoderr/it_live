import 'package:get_it/get_it.dart';
import 'package:itlivetest/core/singletons/dio_settings.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async{
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());
}