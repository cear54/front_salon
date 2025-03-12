import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_admin/src/presentation/pages/auth/register/cubits/reg_a_bloc_cubit.dart';
import 'package:salon_admin/src/presentation/widgets/mis_botones.dart';
import 'package:salon_admin/src/presentation/widgets/mis_btnBack.dart';
import 'package:salon_admin/src/presentation/widgets/mis_textfield.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  RegABlocCubit? _regAblocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _regAblocCubit!.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _regAblocCubit = BlocProvider.of<RegABlocCubit>(context, listen: false);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/imgs/registro_admin.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              color: Color.fromRGBO(0, 0, 0, 0.4),
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.create_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      'REGISTRAR NEGOCIO',
                      style: TextStyle(
                        color: const Color(0xFFFF64D8),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: StreamBuilder(
                          stream: _regAblocCubit!.nameStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                              label: 'Nombre del Negocio',
                              icono: Icons.add_business,
                              iconColor: const Color(0xFFBFDDFF),
                              onChanged: (text) {
                                _regAblocCubit!.changeName(text);
                              },
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: StreamBuilder(
                          stream: _regAblocCubit!.emailStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                              label: 'Correo Electrónico',
                              icono: Icons.email,
                              iconColor: const Color(0xFFBFDDFF),
                              onChanged: (text) {
                                _regAblocCubit!.changeEmail(text);
                              },
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: StreamBuilder(
                          stream: _regAblocCubit?.emailStream,
                          builder: (context, snapshot) {
                            return StreamBuilder(
                                stream: _regAblocCubit!.telefonoStream,
                                builder: (context, snapshot) {
                                  return MisTextfield(
                                    label: 'Teléfono',
                                    icono: Icons.phone_android,
                                    iconColor: const Color(0xFFBFDDFF),
                                    onChanged: (text) {
                                      _regAblocCubit!.changeTelefono(text);
                                    },
                                  );
                                });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: StreamBuilder(
                          stream: _regAblocCubit!.direcStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                              label: 'Dirección (opcional)',
                              icono: Icons.place,
                              iconColor: const Color(0xFFBFDDFF),
                              onChanged: (text) {
                                _regAblocCubit!.changeDirec(text);
                              },
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: StreamBuilder(
                          stream: _regAblocCubit!.passStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                              label: 'Contraseña',
                              icono: Icons.security,
                              obscureText: true,
                              iconColor: const Color(0xFFBFDDFF),
                              onChanged: (text) {
                                _regAblocCubit!.changePassword(text);
                              },
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: StreamBuilder(
                          stream: _regAblocCubit!.pass2Stream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                              label: 'Confirmar Contraseña',
                              obscureText: true,
                              icono: Icons.security,
                              iconColor: const Color(0xFFBFDDFF),
                              onChanged: (text) {
                                _regAblocCubit!.changePassword2(text);
                              },
                            );
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 45, left: 15, right: 15),
                      child: StreamBuilder(
                          stream: _regAblocCubit!.validaForm,
                          builder: (context, snapshot) {
                            return MisBotones(
                              text: 'REGISTRARME',
                              altura: 50,
                              color: const Color(0xFFFF64D8),
                              textColor: Colors.white,
                              onPressed: () {
                                if (snapshot.hasData) {
                                  _regAblocCubit!.registraAdmin();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Faltan campos por llenar",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: const Color(0xFF0A0A0A),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            MisBtnback(
              top: 300,
              left: 10,
              color: const Color.fromARGB(255, 255, 100, 216),
            )
          ],
        ),
      ),
    );
  }
}
