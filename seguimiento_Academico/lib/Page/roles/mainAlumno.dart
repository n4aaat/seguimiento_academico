import 'package:flutter/material.dart';
import '../Pagina1.dart'; // Página de Gestión ágil de proyectos
import '../login.dart'; // Para botón de cerrar sesión

class MainAlumno extends StatelessWidget {
  const MainAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Tabs superiores simuladas
              _buildTabBar(context),

              const SizedBox(height: 10),

              // Título principal
              const Text(
                'SEGUIMIENTO ACADÉMICO',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),

              const SizedBox(height: 30),

              // Botones del contenido principal (en fila)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRoundedButton(context, 'Gestión ágil\nde proyectos'),
                  _buildRoundedButton(context, 'Gestión de\nProyectos de Software'),
                  _buildRoundedButton(context, 'Ingeniería de\nsoftware'),
                ],
              ),

              const Spacer(),

              // Botón rojo "VOLVER"
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'VOLVER',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Tabs superiores con navegación dinámica (por ahora redirigen a Inicio)
Widget _buildTabBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildTab(context, 'INSTRUMENTACIÓN', true),
      _buildTab(context, 'SEGUIMIENTO 1'),
      _buildTab(context, 'SEGUIMIENTO 2'),
      _buildTab(context, 'SEGUIMIENTO 3'),
      _buildTab(context, 'REPORTE FINAL'),
    ],
  );
}

// 🔸 Tab individual con redirección a Inicio (cámbialo después por lo que necesites)
Widget _buildTab(BuildContext context, String label, [bool isActive = false]) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Pagina1()), // ← cámbialo después
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF00A0E3) : const Color(0xFF7A7A7A),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ),
  );
  }



  // 🔸 Botón redondeado que cambia según el texto
  Widget _buildRoundedButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        if (text.contains('Gestión ágil')) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Pagina1()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Vista para "$text" aún no disponible')),
          );
        }
      },
      child: Container(
        width: 140,
        height: 80,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF90A4AE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
