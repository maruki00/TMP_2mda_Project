import "package:provider/provider.dart";
import 'package:provider/single_child_widget.dart';
import 'package:sn/providers/messageprovider.dart';
import 'package:sn/providers/messagesprovider.dart';
import 'package:sn/providers/searchprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/homeprovider.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/signinprovider.dart';
import 'package:sn/providers/signupprovider.dart';
import 'package:sn/providers/profileprovider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => backend<FeedsProvider>(),
  ),
  ChangeNotifierProvider<HomeProvider>(
      create: (context) => backend<HomeProvider>()),
  ChangeNotifierProvider<SigninProvider>(
      create: (context) => backend<SigninProvider>()),
  ChangeNotifierProvider<SignupProvider>(
      create: (context) => backend<SignupProvider>()),
  ChangeNotifierProvider<PostProvider>(
      create: (context) => backend<PostProvider>()),
  ChangeNotifierProvider<MessagesProvider>(
      create: (context) => backend<MessagesProvider>()),
  ChangeNotifierProvider<MessageProvider>(
      create: (context) => backend<MessageProvider>()),
  ChangeNotifierProvider<SearchProvider>(
      create: (context) => backend<SearchProvider>()),
  ChangeNotifierProvider<ProfileProvider>(
      create: (context) => backend<ProfileProvider>()),
];
