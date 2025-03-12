import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_admin/src/presentation/pages/auth/login/cubits/login_bloc_cubit.dart';
import 'package:salon_admin/src/presentation/pages/auth/register/cubits/reg_a_bloc_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBlocCubit>(create: (context) => LoginBlocCubit()),
  BlocProvider<RegABlocCubit>(create: (context) => RegABlocCubit()),
];
