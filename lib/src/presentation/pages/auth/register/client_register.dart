import 'package:flutter/material.dart';
import 'package:salon_admin/src/presentation/widgets/mis_botones.dart';
import 'package:salon_admin/src/presentation/widgets/mis_btnBack.dart';
import 'package:salon_admin/src/presentation/widgets/mis_textfield.dart';

class ClientRegister extends StatelessWidget {
  const ClientRegister({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: MisTextfield(
                          label: 'Nombre',
                          icono: Icons.abc_outlined,
                          onChanged: (text) {}),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: MisTextfield(
                          label: 'Teléfono',
                          icono: Icons.phone,
                          onChanged: (text) {}),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: MisTextfield(
                          label: 'Correo Electónico',
                          icono: Icons.email,
                          onChanged: (text) {}),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: MisTextfield(
                          label: 'ID grupo',
                          icono: Icons.key,
                          onChanged: (text) {}),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: MisTextfield(
                          label: 'Contraseña',
                          icono: Icons.lock,
                          onChanged: (text) {}),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: MisTextfield(
                          label: 'Repita Contraseña',
                          icono: Icons.lock_outline,
                          onChanged: (text) {}),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 20, right: 20),
                      child: MisBotones(
                        text: 'REGISTRARME',
                        onPressed: () {},
                        altura: 40,
                        color: const Color(0xFFFF00BF),
                        textColor: Colors.white,
                      ),
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
