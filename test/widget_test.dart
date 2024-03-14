import 'package:flutter_test/flutter_test.dart';

import 'package:acceso_alumnos/main.dart';

void main() {
  testWidgets('App UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Elimina 'const' aquí

    // Verificar que el título esté presente.
    expect(find.text('Reconocimiento Facial'), findsOneWidget);

    // Verificar que el texto esté presente.
    expect(find.text('Implementación de un sistema de reconocimiento facial para el control de acceso de alumnos de la Universidad Tecnológica de San Juan del Río.'), findsOneWidget);

    // Verificar que el botón esté presente.
    expect(find.text('Get Start'), findsOneWidget);
  });
}
