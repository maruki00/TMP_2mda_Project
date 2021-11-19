import 'package:get_it/get_it.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/homeprovider.dart';

GetIt backend = GetIt.instance();
setup() {
  backend.registerLazySingleton(() => FeedsProvider());
  backend.registerLazySingleton(() => HomeProvider());
}
