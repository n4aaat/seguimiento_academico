import 'package:flutter/material.dart';

// Pantalla que muestra los principios y metodologías de la gestión ágil
class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con título personalizado
      appBar: AppBar(
        title: const Text('Gestión ágil royectos'), // (corregir "royectos" si fue un error)
        backgroundColor: const Color(0xFF00A0E3), // Color personalizado
      ),

      // Cuerpo principal con padding alrededor///////
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título grande de la pantalla
            const Text(
              'Gestión ágil de proyectos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Subtítulo
            const Text(
              'Principios de la gestión ágil:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Lista de principios ágiles
            _buildPrincipleItem('Individuos e interacciones sobre procesos y herramientas'),
            _buildPrincipleItem('Software funcionando sobre documentación extensiva'),
            _buildPrincipleItem('Colaboración con el cliente sobre negociación contractual'),
            _buildPrincipleItem('Respuesta ante el cambio sobre seguir un plan'),

            const SizedBox(height: 30),

            // Subtítulo de metodologías
            const Text(
              'Metodologías ágiles comunes:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Cuadrícula con metodologías
            _buildMethodsGrid(),

            // Botón "VOLVER" al final, alineado al centro
            const Spacer(),
            Center(
              child: _buildBackButton(context), // Botón encapsulado abajo
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Generador de un principio con viñeta
  Widget _buildPrincipleItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // 🔸 Cuadrícula de metodologías ágiles
  Widget _buildMethodsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        _buildMethodItem('Scrum'),
        _buildMethodItem('Kanban'),
        _buildMethodItem('XP (Extreme Programming)'),
        _buildMethodItem('Lean Software Development'),
      ],
    );
  }

  // 🔹 Caja decorada para cada metodología
  Widget _buildMethodItem(String text) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7F98B2),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  // 🔴 Botón para volver a la pantalla anterior
  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Regresa a la pantalla anterior
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
