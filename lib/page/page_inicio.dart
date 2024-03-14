import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Recognition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/logo.png', // Ruta de tu logo
                  fit: BoxFit.contain,
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 80),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Face Recognition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Implementación de un sistema de reconocimiento facial para el control de acceso de alumnos de la Universidad Tecnológica de San Juan del Río.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: '', // Agregar tipo de letra
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes agregar la funcionalidad para el botón
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green), // Cambiar color a verde
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20)), // Ajustar el relleno para hacerlo más pequeño
                      ),
                      child: Text(
                        'Get Start',
                        style: TextStyle(
                          fontSize: 20, // Tamaño de fuente más pequeño
                          color: Colors.white, // Cambiar color del texto a blanco
                          fontWeight: FontWeight.bold, // Hacer el texto en negrita
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  Image.asset(
                    'assets/imagen1.png', // Ruta de la primera imagen
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/imagen2.png', // Ruta de la segunda imagen
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 365),
                  Container(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Copyright | 2024',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
