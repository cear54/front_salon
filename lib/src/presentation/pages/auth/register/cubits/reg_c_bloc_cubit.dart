import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reg_c_bloc_state.dart';

class RegCBlocCubit extends Cubit<RegCBlocState> {
  RegCBlocCubit() : super(RegisterCInitial());

  final _nameController = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _idgrupoController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _password2Controller = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get telefonoStream => _telefonoController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get idgrupoStram => _idgrupoController.stream;
  Stream<String> get passStream => _passwordController.stream;
  Stream<String> get pass2Stream => _password2Controller.stream;

  void changeName(String name) {
    if (name.isNotEmpty && name.length < 2) {
      _nameController.sink.addError('Al menos 2 caracteres');
    } else {
      _nameController.sink.add(name);
    }
  }

  void changeTelefono(String telefono) {
    if (telefono.isNotEmpty && telefono.length < 6) {
      _telefonoController.sink.addError('Al menos 6 caracteres');
    } else {
      _telefonoController.sink.add(telefono);
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changeIdgupo(String idgrupo) {
    if (idgrupo.isNotEmpty && idgrupo.length < 14 || idgrupo.length > 14) {
      _idgrupoController.sink.addError('Debe contener 14 caracteresa)');
    } else {
      _idgrupoController.sink.add(idgrupo);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 4) {
      _passwordController.sink.addError('Al menos 4 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void changePassword2(String pass2) {
    if (pass2.isNotEmpty && pass2.length < 4) {
      _password2Controller.sink.addError('Al menos 4 caracteres');
    } else {
      _password2Controller.sink.add(pass2);
    }
  }

  void registraCliente() {
    print('Nombre: ${_nameController.value}');
    print('Telefono: ${_telefonoController.value}');
    print('Email: ${_emailController.value}');
    print('ID grupo: ${_idgrupoController.value}');
    print('Pass: ${_passwordController.value}');
    print('PAss2: ${_password2Controller.value}');
  }

  Stream<bool> get validaFormC => Rx.combineLatest6(
      nameStream,
      emailStream,
      telefonoStream,
      idgrupoStram,
      passStream,
      pass2Stream,
      (a, b, c, d, e, f) => true);

  void dispose() {
    changeName('');
    changeEmail('');
    changeTelefono('');
    changeIdgupo('');
    changePassword('');
    changePassword2('');
  }
}
