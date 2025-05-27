import 'package:flutter/material.dart';
import '../inicio.dart';

class MainJefa extends StatelessWidget {
  const MainJefa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTabBar(context),
            const SizedBox(height: 10),
            const Text(
              'SEGUIMIENTO ACADÉMICO',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFilterSection(),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTableSection(context)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // PDF functionality pending
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('PDF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Inicio()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('VOLVER', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final tabs = [
      'INSTRUMENTACIÓN',
      'SEGUIMIENTO 1',
      'SEGUIMIENTO 2',
      'SEGUIMIENTO 3',
      'REPORTE FINAL',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tabs.map((label) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Inicio()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: label == 'INSTRUMENTACIÓN' ? const Color(0xFF00A0E3) : const Color(0xFF7A7A7A),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFilterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xFFB0C4DE),
          padding: const EdgeInsets.all(6),
          child: const Text('Filtrar por:', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        const Text('Docente'),
        const SizedBox(height: 4),
        SizedBox(
          width: 150,
          child: DropdownButtonFormField<String>(
            items: const [], // Agrega opciones luego
            onChanged: (value) {},
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Materia'),
        const SizedBox(height: 4),
        SizedBox(
          width: 150,
          child: DropdownButtonFormField<String>(
            items: const [], // Agrega opciones luego
            onChanged: (value) {},
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }

  Widget _buildTableSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: const [
        DataColumn(label: Text('Docente')),
        DataColumn(label: Text('Materia')),
        DataColumn(label: Text('Entregado')),
        DataColumn(label: Text('Aprobado')),
        DataColumn(label: Text('')),
      ], rows: [
        DataRow(cells: [
          const DataCell(Text('Hendrix Daniel Herrera Sosa')),
          const DataCell(Text('Fundamentos de Investigación')),
          const DataCell(Text('1')),
          const DataCell(Text('0')),
          DataCell(IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () {
              // Acción para visualizar el contenido
            },
          )),
        ])
      ]),
    );
  }
}
