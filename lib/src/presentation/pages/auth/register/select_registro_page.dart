import 'package:flutter/material.dart';

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
              // color: Color.fromRGBO(0, 0, 0, 0.3),
              // colorBlendMode: BlendMode.darken,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.6),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Si eres propietari@ de un negocio dedicado a la belleza, eres un ADMINISTRADOR',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 112, 0, 132)),
                    ),
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
