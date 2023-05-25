import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesHumedad.dart';
import 'package:flutter_application_1/pages/pagesMisPlantas.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesPlantas.dart';
import 'package:flutter_application_1/pages/pagesUser.dart';

class PagesMenu extends StatelessWidget {
  final int? userId;
  const PagesMenu({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white10,
      ),

      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        backgroundColor: const Color(0xFFFBF8EF),
        appBar: AppBar(
          title: const Text('Bienvenido'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
            ),
            const Text(
              "Hola",
              style: TextStyle(color: Colors.black, fontSize: 50),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'User ID: $userId',
              style: const TextStyle(color: Colors.black, fontSize: 60),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFBF8EF)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PagesUsuarios(userid: userId),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/usu.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFBF8EF)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MisPlantas(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/pla.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
