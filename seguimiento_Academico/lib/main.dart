import 'package:flutter/material.dart';

// Importa la pantalla de login (ajusta el import si es necesario)
import 'Page/login.dart';

// Importa las demás pantallas que forman parte de la app
import 'Page/inicio.dart';
import 'Page/Pagina1.dart';
import 'Page/Pagina2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seguimiento Académico',

      // ❌ Ya no usamos initialRoute, porque `home` debe ser la primera pantalla
      // initialRoute: "Inicio",

      routes: {
        "Inicio": (context) => const Inicio(),
        "Pagina1": (context) => const Pagina1(),
        "Pagina2": (context) => const Pagina2(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const LoginPage(), // ✅ Esta es ahora la pantalla inicial
    );
  }
}
