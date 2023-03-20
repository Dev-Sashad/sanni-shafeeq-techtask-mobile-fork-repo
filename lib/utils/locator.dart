import 'package:get_it/get_it.dart';
import 'package:tech_task/core/repository/request_repo.dart';
import '../core/services/navigation_service.dart';
import '../core/services/snackbar_services.dart';
import '../data/network_request.dart';
import '_utils.dart';

final locator = GetIt.instance;

void setupServices() {
  //SERVICES LIKE STATE STORAGE
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<ProgressService>(() => ProgressService());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarService());
  // NETWORK
  locator.registerLazySingleton<NetworkService>(() => NetworkServiceImp());

  // REPOSITORY
  locator.registerLazySingleton<RequestRepo>(() => RequestRepoImpl(locator()));
}
