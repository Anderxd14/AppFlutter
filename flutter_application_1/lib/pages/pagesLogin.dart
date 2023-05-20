import 'package:flutter/material.dart';

class PagesLogin extends StatefulWidget {
  const PagesLogin({super.key});

  @override
  State<PagesLogin> createState() => _PagesLoginState();
}

class _PagesLoginState extends State<PagesLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8EF),
      body: ListView(
        children: [
          Image.asset(
            'logo.png',
            height: 80,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hola",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  SizedBox(
                    height: null,
                  )
                ],
              )),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(Usuario)",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              )),
          Container(
            margin: const EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'Imagen2r.png',
                height: 40,
              ),
              Image.asset(
                'Imagen3r.png',
                height: 40,
              ),
              Image.asset(
                'Imagen1r.png',
                height: 40,
              ),
            ],
          ),
          Container(
            // height: 100,
            margin: const EdgeInsets.fromLTRB(100, 50, 100, 0),
            //margin: const EdgeInsets.all(150),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF04D0D9),
              border: Border.all(
                color: const Color(0xFF04D0D9),
                width: 0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: const Text("Continuar",
                style: TextStyle(color: Color(0xFFFBF8EF), fontSize: 20)),
          )
        ],
      ),
    );
  }
}
