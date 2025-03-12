import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_admin/src/presentation/pages/auth/login/login_bloc_cubit.dart';
import 'package:salon_admin/src/presentation/widgets/mis_botones.dart';
import 'package:salon_admin/src/presentation/widgets/mis_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBlocCubit? _loginBlocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loginBlocCubit?.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: false);

    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/imgs/buty01.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            // color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.282),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  'L O G I N',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: StreamBuilder(
                      stream: _loginBlocCubit?.emailStream,
                      builder: (context, snapshot) {
                        return MisTextfield(
                          label: 'Correo Electrónico ',
                          icono: Icons.email,
                          onChanged: (text) {
                            _loginBlocCubit?.change_mail(text);
                          },
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: StreamBuilder(
                      stream: _loginBlocCubit?.passwordStream,
                      builder: (context, snapshot) {
                        return MisTextfield(
                          label: 'Contraseña ',
                          icono: Icons.key,
                          obscureText: true,
                          onChanged: (text) {
                            _loginBlocCubit?.change_pass(text);
                          },
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: StreamBuilder(
                        stream: _loginBlocCubit!.validateForm,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            onPressed: () {
                              if (snapshot.hasData) {
                                _loginBlocCubit!.login();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "El formulario no es válido",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        const Color.fromARGB(255, 0, 4, 255),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: snapshot.hasData
                                    ? const Color(0xFFCCFF00)
                                    : const Color(0xFFFF25BE)),
                            child: Text(
                              'INICIAR SESION',
                              style: TextStyle(
                                  color: snapshot.hasData
                                      ? Colors.deepPurple
                                      : Colors.white),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'No tienes cuenta?',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Container(
                      width: 60,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                  child: MisBotones(
                    text: 'REGISTRAR',
                    color: const Color.fromARGB(255, 14, 0, 90),
                    textColor: Colors.white,
                    altura: 35,
                    onPressed: () {
                      Navigator.pushNamed(context, 'select');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
