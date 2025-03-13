import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_admin/src/presentation/pages/auth/register/cubits/reg_c_bloc_cubit.dart';
import 'package:salon_admin/src/presentation/widgets/mis_botones.dart';
import 'package:salon_admin/src/presentation/widgets/mis_btnBack.dart';
import 'package:salon_admin/src/presentation/widgets/mis_textfield.dart';

class ClientRegister extends StatefulWidget {
  const ClientRegister({super.key});

  @override
  State<ClientRegister> createState() => _ClientRegisterState();
}

class _ClientRegisterState extends State<ClientRegister> {
  RegCBlocCubit? _regCBlocCubit;

  @override
  Widget build(BuildContext context) {
    _regCBlocCubit = BlocProvider.of<RegCBlocCubit>(context, listen: false);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/imgs/registrar.jpg',
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
                      height: 10,
                    ),
                    Icon(
                      Icons.person_add_alt_1_outlined,
                      size: 60,
                      color: const Color(0xFFFF00BF),
                    ),
                    Text(
                      'REGISTRAR USUARIO',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 254, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 25),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.nameStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                                label: 'Nombre',
                                icono: Icons.abc_outlined,
                                onChanged: (text) {
                                  _regCBlocCubit!.changeName(text);
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.telefonoStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                                label: 'Teléfono',
                                icono: Icons.phone,
                                onChanged: (text) {
                                  _regCBlocCubit!.changeTelefono(text);
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.emailStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                                label: 'Correo Electónico',
                                icono: Icons.email,
                                onChanged: (text) {
                                  _regCBlocCubit!.changeEmail(text);
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.idgrupoStram,
                          builder: (context, snapshot) {
                            return MisTextfield(
                                label: 'ID grupo',
                                icono: Icons.key,
                                onChanged: (text) {
                                  _regCBlocCubit!.changeIdgupo(text);
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.passStream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                                label: 'Contraseña',
                                icono: Icons.lock,
                                onChanged: (text) {
                                  _regCBlocCubit!.changePassword(text);
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.pass2Stream,
                          builder: (context, snapshot) {
                            return MisTextfield(
                                label: 'Repita Contraseña',
                                icono: Icons.lock_outline,
                                onChanged: (text) {
                                  _regCBlocCubit!.changePassword2(text);
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 20, right: 20),
                      child: StreamBuilder(
                          stream: _regCBlocCubit!.validaFormC,
                          builder: (context, snapshot) {
                            return MisBotones(
                              text: 'REGISTRARME',
                              onPressed: () {
                                if (snapshot.hasData) {
                                  _regCBlocCubit!.registraCliente();
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
                              altura: 40,
                              color: const Color(0xFFFF00BF),
                              textColor: Colors.white,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            MisBtnback(top: 300, left: 10)
          ],
        ),
      ),
    );
  }
}
