import 'package:appwrite_tracker/appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';

void initDependencies() {
  final getIt = GetIt.instance;
  // register lazy = register single data mendapatkan satu instance dan
  // tidak memerlukan banyak instance, lazy = instance tersebut tidak 
  // akan dibuat sampai selesai digunakan untuk pertama kalinya agar tidak overhead
  getIt.registerLazySingleton(() => Appwrite());
}
