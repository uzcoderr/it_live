import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:itlivetest/core/singletons/service_locator.dart';
import 'package:itlivetest/core/singletons/storage/storage.dart';
import 'package:itlivetest/core/singletons/storage/storage_keys.dart';
import 'package:itlivetest/feature/login/presentation/login_screen.dart';
import 'package:itlivetest/feature/main/presentation/main_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<bool> checkApi()async{
  await Future.delayed(const Duration(seconds: 1));
  return false;
}
Future<bool> checkLocal()async{
  String token = StorageRepository.getString(StoreKeys.token);
  print(token);
  if(token.isEmpty){
    return false;
  }else{
    return true;
  }
}
Widget page = const LoginScreen();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  HttpOverrides.global = MyHttpOverrides();
  final isAvailableToken = await checkApi();
  final isAlreadyLogin = await checkLocal();
  if(isAlreadyLogin){
    page = const MainScreen();
  }
  runApp(MyApp(page: page,));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final Widget page;
  const MyApp({super.key,required this.page});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'DEF',
      ),
      home: page,
    );
  }
}
