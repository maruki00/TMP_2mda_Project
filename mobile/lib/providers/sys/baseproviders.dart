import 'package:get_it/get_it.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/homeprovider.dart';
import 'package:sn/providers/messageprovider.dart';
import 'package:sn/providers/messagesprovider.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/searchprovider.dart';
import 'package:sn/providers/signinprovider.dart';
import 'package:sn/providers/signupprovider.dart';
import 'package:sn/providers/profileprovider.dart';

GetIt backend = GetIt.instance;
setup() {
  backend.registerLazySingleton(() => FeedsProvider());
  backend.registerLazySingleton(() => HomeProvider());
  backend.registerLazySingleton(() => SigninProvider());
  backend.registerLazySingleton(() => SignupProvider());
  backend.registerLazySingleton(() => PostProvider());
  backend.registerLazySingleton(() => MessagesProvider());
  backend.registerLazySingleton(() => MessageProvider());
  backend.registerLazySingleton(() => SearchProvider());
  backend.registerLazySingleton(() => ProfileProvider());
}
