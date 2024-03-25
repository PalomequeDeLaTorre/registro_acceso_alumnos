import 'package:acceso_alumnos/page/page_historial.dart';
import 'package:acceso_alumnos/page/page_login.dart';
import 'package:acceso_alumnos/page/page_bienvenido.dart';
import 'package:flutter/material.dart';
import 'package:acceso_alumnos/page/page_inicio.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

void navigateToLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

void navigateToBienbenidoPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PageBienvenido()),
  );
}

void navigateToHistorialPage(BuildContext context) {
  // Aquí necesitas proporcionar un cliente MQTT válido al crear PageHistorial
  // Por ahora, puedes pasar null si no tienes uno disponible
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PageHistorial(client: null)),
  );
}
