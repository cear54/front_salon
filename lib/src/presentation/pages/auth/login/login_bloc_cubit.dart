import 'package:rxdart/rxdart.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_admin/src/presentation/pages/auth/login/login_bloc.dart';

class LoginBlocCubit extends Cubit<LoginBloc> {
  LoginBlocCubit() : super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void change_mail(String email) {
    _emailController.sink.add(email);
  }

  void change_pass(String password) {
    _passwordController.sink.add(password);
  }

  void login() {
    print('Email ${_emailController.value}');
    print('Email ${_passwordController.value}');
  }
}
