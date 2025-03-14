import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_admin/src/bloc_providers.dart';
import 'package:salon_admin/src/presentation/pages/auth/login/login_page.dart';
import 'package:salon_admin/src/presentation/pages/auth/register/reg_a_page.dart';
import 'package:salon_admin/src/presentation/pages/auth/register/select_registro_page.dart';

import 'src/presentation/pages/auth/register/reg_c_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      // [
      //   BlocProvider(
      //     create: (context) => LoginBlocCubit(),
      //   ),
      //   BlocProvider(
      //     create: (context) => RegABlocCubit(),
      //   ),
      // ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //quitar debug
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'select': (BuildContext context) => SelectRegistroPage(),
          'client': (BuildContext context) => ClientRegister(),
        },
      ),
    );
  }
}
