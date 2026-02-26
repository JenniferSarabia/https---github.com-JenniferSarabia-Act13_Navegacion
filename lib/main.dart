import 'package:flutter/material.dart';
import 'paginas/pagina0.dart';
import 'paginas/pagina1.dart';
import 'paginas/pagina2.dart';
import 'paginas/pagina3.dart';

void main() => runApp(const UrbaYFlowApp());

class UrbaYFlowApp extends StatelessWidget {
  const UrbaYFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      // La página de inicio es Pagina0
      home: const Pagina0(),
      // Definición de las rutas de la aplicación
      routes: {
        '/pagina0': (context) => const Pagina0(),
        '/pagina1': (context) => const Pagina1(),
        '/pagina2': (context) => const Pagina2(),
        '/pagina3': (context) => const Pagina3(),
      },
    );
  }
}
