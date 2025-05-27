import 'package:flutter/material.dart';
import '../Pagina1.dart';
import '../login.dart';

class MainDocente extends StatelessWidget {
  const MainDocente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🟦 Tabs superiores
              _buildNavigationBar(context),

              const SizedBox(height: 10),

              // 🟪 Título principal estilizado
              _buildMainTitle(),

              const SizedBox(height: 30),

              // 🟨 Botones redondeados del contenido principal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRoundedButton(context, 'Gestión ágil\nde proyectos'),
                  _buildRoundedButton(context, 'Gestión de\nProyectos de Software'),
                  _buildRoundedButton(context, 'Ingeniería de\nsoftware'),
                ],
              ),

              const Spacer(),

              // 🔴 Botón VOLVER
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

  // 🟦 Navegación horizontal completa (tabs)
  Widget _buildNavigationBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xFF00A0E3),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            alignment: Alignment.center,
            child: const Text(
              'INSTRUMENTACIÓN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        for (int i = 1; i <= 3; i++)
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Pagina1()), // Puedes cambiar luego
                );
              },
              child: Container(
                color: const Color(0xFF888888),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                alignment: Alignment.center,
                child: Text(
                  'SEGUIMIENTO $i',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Pagina1()),
              );
            },
            child: Container(
              color: const Color(0xFF888888),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'REPORTE FINAL',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 🟪 Título principal con fondo oscuro
  Widget _buildMainTitle() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2C3E50),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.center,
      child: const Text(
        'SEGUIMIENTO ACADÉMICO',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  // 🟨 Botones redondeados por materia
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
