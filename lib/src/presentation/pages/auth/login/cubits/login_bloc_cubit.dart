import 'package:rxdart/rxdart.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_admin/src/presentation/pages/auth/login/cubits/login_bloc_state.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void change_mail(String email) {
    if (email.length < 6) {
      _emailController.sink.addError('El email es muy corto');
    } else {
      _emailController.sink.add(email);
    }
  }

  void change_pass(String password) {
    if (password.length < 3) {
      _passwordController.sink.addError('Contraseña muy corta');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void dispose() {
    change_mail('');
    change_pass('');
  }

  void login() {
    print('Email ${_emailController.value}');
    print('Email ${_passwordController.value}');
  }
}
