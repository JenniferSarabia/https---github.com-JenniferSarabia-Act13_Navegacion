import 'package:flutter/material.dart';
import 'paginas/pagina0.dart';
import 'paginas/pagina1.dart';
import 'paginas/pagina2.dart';

void main() => runApp(const UrbaYFlowApp());

class UrbaYFlowApp extends StatelessWidget {
  const UrbaYFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      // Ahora el home es Pagina0
      home: const Pagina0(),
      routes: {
        '/pagina0': (context) => const Pagina0(),
        '/pagina1': (context) => const Pagina1(),
        '/pagina2': (context) => const Pagina2(),
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      backgroundColor: const Color(0xFF003B7A),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          _drawerLink(context, "Inicio", currentRoute == '/' || currentRoute == '/pagina0', () {
            Navigator.pushReplacementNamed(context, '/pagina0');
          }),
          _drawerLink(context, "Colecciones", currentRoute == '/pagina1', () {
            Navigator.pushReplacementNamed(context, '/pagina1');
          }),
          _drawerLink(context, "Ofertas", currentRoute == '/pagina2', () {
            Navigator.pushReplacementNamed(context, '/pagina2');
          }),
        ],
      ),
    );
  }

  Widget _drawerLink(BuildContext context, String title, bool active, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: TextStyle(color: active ? Colors.lightBlueAccent : Colors.white)),
      onTap: onTap,
    );
  }
}