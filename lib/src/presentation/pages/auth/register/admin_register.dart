import 'package:flutter/material.dart';
import 'package:salon_admin/src/presentation/widgets/mis_botones.dart';
import 'package:salon_admin/src/presentation/widgets/mis_btnBack.dart';
import 'package:salon_admin/src/presentation/widgets/mis_textfield.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: MisTextfield(
                        label: 'Nombre del Negocio',
                        icono: Icons.add_business,
                        iconColor: const Color(0xFFBFDDFF),
                        onChanged: (text) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: MisTextfield(
                        label: 'Correo Electrónico',
                        icono: Icons.email,
                        iconColor: const Color(0xFFBFDDFF),
                        onChanged: (text) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: MisTextfield(
                        label: 'Teléfono',
                        icono: Icons.phone_android,
                        iconColor: const Color(0xFFBFDDFF),
                        onChanged: (text) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: MisTextfield(
                        label: 'Dirección (opcional)',
                        icono: Icons.place,
                        iconColor: const Color(0xFFBFDDFF),
                        onChanged: (text) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: MisTextfield(
                        label: 'Contraseña',
                        icono: Icons.security,
                        iconColor: const Color(0xFFBFDDFF),
                        onChanged: (text) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: MisTextfield(
                        label: 'Confirmar Contraseña',
                        icono: Icons.security,
                        iconColor: const Color(0xFFBFDDFF),
                        onChanged: (text) {},
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 45, left: 15, right: 15),
                      child: MisBotones(
                          text: 'REGISTRARME',
                          altura: 50,
                          color: const Color(0xFFFF64D8),
                          textColor: Colors.white,
                          onPressed: () {}),
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
