import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'page_bienvenido.dart'; 

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  mqtt.MqttClient? client; // Cliente MQTT

  @override
  void initState() {
    super.initState();
    _setupMQTT();
  }

  void _setupMQTT() async {
    client = mqtt.MqttClient('broker.example.com', ''); // Cambia 'broker.example.com' por tu servidor MQTT
    // Configurar opciones de conexión, como credenciales si es necesario
    // Escuchar mensajes entrantes
    client?.updates?.listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>> messages) {
      // Procesar los mensajes recibidos
    });

    try {
      await client?.connect();
      print('Conectado al servidor MQTT');
    } catch (e) {
      print('Error al conectar al servidor MQTT: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 3, 136, 202), Color.fromRGBO(12, 108, 163, 1)],
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
            padding: EdgeInsets.all(7),
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
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Número de expediente:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(
                          'Usuario:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Contraseña:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextField(
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 70),
                        Center( 
                          child: ElevatedButton(
                            onPressed: () {
                              // Aquí va la lógica para el botón 
                              _signIn();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 32, 160, 117)),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0), 
                                ),
                              ),
                            ),
                            child: Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      'assets/ImgView.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
                  SizedBox(height: 90),
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

  void _signIn() {
    // Lógica para autenticar al usuario
    String usuario = '2022143015'; // Usuario
    String contrasena = '2022143015'; // Contraseña

    // Verifica si el usuario y la contraseña coinciden
    if (usuario == '2022143015' && contrasena == '2022143015') {
      // Autenticación exitosa
      if (client != null) {
        // Suscríbete a un tema MQTT después de la autenticación
        client?.subscribe('historial/alumno/expediente123', mqtt.MqttQos.atMostOnce);
 // Sustituye 'expediente123' con el expediente del usuario autenticado
        // Redirige a la página de bienvenida
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageBienvenido()),
        );
      } else {
        print('El cliente MQTT es nulo');
        // Realiza alguna acción de manejo de errores, como mostrar un mensaje de error
      }
    } else {
      // Autenticación fallida
      // Muestra un mensaje de error o realiza otras acciones según sea necesario
    }
  }
}
