import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;

class PageHistorial extends StatelessWidget {
  final mqtt.MqttClient? client;

  PageHistorial({required this.client});

  @override
  Widget build(BuildContext context) {
    List<String> historial = [];
    
    client?.updates?.listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>>? messages) {
      final mqtt.MqttPublishMessage recMess = messages![0].payload as mqtt.MqttPublishMessage;
      final String message = mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      historial.add(message);
    });

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 3, 136, 202),
                  Color.fromRGBO(12, 108, 163, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/imgLogo.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Historial de registro del alumno:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'UTSJR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'Registro de entrada:',
                      textAlign: TextAlign.justify,
                       style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Color.fromARGB(255, 0, 26, 255),
                      ),
                    ),
                  ),
                   SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'Registro de salida:',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí tu lógica para el botón
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 209, 255, 2)),
                        padding:
                            MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Registros archivados',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(221, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 350),
                  Center(
                    child: Image.asset(
                      'assets/imgUT.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                  SizedBox(height: 20),
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
