import 'package:get_it/get_it.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/homeprovider.dart';
import 'package:sn/providers/signinprovider.dart';
import 'package:sn/providers/signupprovider.dart';

GetIt backend = GetIt.instance;
setup() {
  backend.registerLazySingleton(() => FeedsProvider());
  backend.registerLazySingleton(() => HomeProvider());
  backend.registerLazySingleton(() => SigninProvider());
  backend.registerLazySingleton(() => SignupProvider());
}
