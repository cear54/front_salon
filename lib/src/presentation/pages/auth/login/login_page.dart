import 'package:flutter/material.dart';
import 'package:salon_admin/src/presentation/widgets/mis_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: MisTextfield(
                    label: 'Correo Electrónico ',
                    icono: Icons.email,
                    onChanged: (text) {
                      print('TEXTO: ${text}');
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: MisTextfield(
                    label: 'Contraseña ',
                    icono: Icons.key,
                    obscureText: true,
                    onChanged: (text) {
                      print('TEXTO: ${text}');
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCCFF00)),
                      child: Text(
                        'INICIAR SESION',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'registro');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF001EFF)),
                      child: Text(
                        'REGISTRATE',
                        style: TextStyle(color: const Color(0xFFFAFAFA)),
                      ),
                    ),
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
