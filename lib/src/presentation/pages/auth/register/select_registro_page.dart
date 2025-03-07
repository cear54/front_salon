import 'package:flutter/material.dart';
import 'package:salon_admin/src/presentation/widgets/mis_btnBack.dart';

import '../../../widgets/mis_botones.dart';

class SelectRegistroPage extends StatelessWidget {
  const SelectRegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Stack(
          //alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/imgs/reg_adm_clien.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              color: Color.fromRGBO(0, 0, 0, 0.3),
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 100),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'PROPIETARIO DE NEGOCIO\nDEDICADO A LA BELLEZA',
                      style: TextStyle(
                          fontSize: 10,
                          //fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 112, 0, 132)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: MisBotones(
                        text: 'ADMINISTRACION',
                        altura: 45,
                        color: Color.fromARGB(255, 14, 0, 90),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, 'registro');
                        }),
                  )
                ],
              ),
            ),
            MisBtnback(
              top: 300,
              left: 10,
              color: const Color.fromARGB(255, 255, 100, 216),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 410),
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'USUARIOS Y CLIENTES\nDE LA BELLEZA CON ID',
                      style: TextStyle(
                          fontSize: 10,
                          //fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 112, 0, 132)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: MisBotones(
                        text: 'U S U A R I O',
                        altura: 45,
                        color: Color.from(
                            alpha: 1, red: 0, green: 0.686, blue: 0.035),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, 'client');
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
