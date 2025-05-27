import 'package:flutter/material.dart';
import 'login.dart'; // Asegúrate de que esta ruta sea correcta

// Pantalla de Inicio
class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Contenido principal de la pantalla organizado en columnas
      body: Column(
        children: [
          // Sección superior con una barra de navegación personalizada
          _buildNavigationBar(),

          // Título principal centrado
          _buildMainTitle(),

          // Sección de contenido central, que se expande según el tamaño de la pantalla
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildContent(context),
            ),
          ),

          // Botón de volver, alineado a la parte inferior izquierda
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _buildBackButton(context), // Ahora recibe el contexto
            ),
          ),
        ],
      ),
    );
  }

  // 🟦 Barra de navegación personalizada
  Widget _buildNavigationBar() {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.white),
          Text('Inicio', style: TextStyle(color: Colors.white, fontSize: 20)),
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }

  // 🟩 Título principal
  Widget _buildMainTitle() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          'Bienvenido al sistema de seguimiento académico',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // 🟨 Contenido central simulado (puedes personalizarlo)
  Widget _buildContent(BuildContext context) {
    return const Center(
      child: Text(
        'Aquí irá el contenido dinámico o los accesos a los módulos.',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  // 🔴 Botón para volver al Login
  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: const Text(
        'VOLVER',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

}
