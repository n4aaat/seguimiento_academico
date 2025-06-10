import 'package:flutter/material.dart';
import '../inicio.dart';
import '../login.dart';

class MainRevisor extends StatelessWidget {
  const MainRevisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔷 Tabs de navegación superior
              _buildTabBar(context),

              const SizedBox(height: 10),

              // 🟪 Título principal estilizado (igual que mainDocente)
              _buildMainTitle(),

              const SizedBox(height: 20),

              // 🔷 Filtros y tabla
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filtros
                    _buildFilterPanel(),

                    const SizedBox(width: 16),

                    // Tabla de seguimiento
                    Expanded(child: _buildTable(context)),
                  ],
                ),
              ),

              // 🔷 Botones finales
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // funcionalidad pendiente
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('PDF', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('VOLVER', style: TextStyle(color: Colors.white)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // 🔷 Tabs navegables - igual que mainDocente
  Widget _buildTabBar(BuildContext context) {
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
                  MaterialPageRoute(builder: (_) => const Inicio()), // Puedes cambiar luego
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
                MaterialPageRoute(builder: (_) => const Inicio()),
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

  // 🟪 Título principal con fondo oscuro y marco gris (igual que mainDocente)
  Widget _buildMainTitle() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF888888), // Fondo gris exterior
      padding: const EdgeInsets.all(2.0), // Padding gris alrededor
      child: Container(
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
      ),
    );
  }

  // 🔷 Panel lateral con filtros
  Widget _buildFilterPanel() {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filtrar por:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          const Text('Docente'),
          DropdownButtonFormField<String>(
            items: const [],
            onChanged: (_) {},
            decoration: _dropdownStyle(),
          ),
          const SizedBox(height: 20),
          const Text('Materia'),
          DropdownButtonFormField<String>(
            items: const [],
            onChanged: (_) {},
            decoration: _dropdownStyle(),
          ),
        ],
      ),
    );
  }

  InputDecoration _dropdownStyle() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  // 🔷 Tabla de datos de seguimiento
  Widget _buildTable(BuildContext context) {
    final headers = ['Docente', 'Materia', 'Entregado', 'Aprobado', ''];
    final data = [
      {
        'docente': 'Hendrix Daniel Herrera Sosa',
        'materia': 'Fundamentos de Investigación',
        'entregado': '1',
        'aprobado': '0',
      }
    ];

    return DataTable(
      headingRowColor: WidgetStateProperty.all(Colors.grey.shade200),
      columns: headers.map((h) => DataColumn(label: Text(h, style: const TextStyle(fontWeight: FontWeight.bold)))).toList(),
      rows: data.map((row) {
        return DataRow(
          cells: [
            DataCell(Text(row['docente']!)),
            DataCell(Text(row['materia']!)),
            DataCell(Text(row['entregado']!)),
            DataCell(Text(row['aprobado']!)),
            DataCell(IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                // aquí puedes navegar a detalles
              },
            )),
          ],
        );
      }).toList(),
    );
  }
}