import 'package:flutter/material.dart';
// Importa las demás pantallas que forman parte de la app
import 'roles/roles.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  String error = '';

  void _login() {
  final user = _userController.text.trim();
  final pass = _passController.text;

  switch (user) {
    case 'docente':
      if (pass == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainDocente()),
        );
      } else {
        setState(() {
          error = 'Contraseña incorrecta';
        });
      }
      break;

    case 'alumno':
      if (pass == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainAlumno()),
        );
      } else {
        setState(() {
          error = 'Contraseña incorrecta';
        });
      }
      break;

    case 'jefacademica':
      if (pass == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainJefa()),
        );
      } else {
        setState(() {
          error = 'Contraseña incorrecta';
        });
      }
      break;

    case 'revisor':
      if (pass == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainRevisor()),
        );
      } else {
        setState(() {
          error = 'Contraseña incorrecta';
        });
      }
      break;

    default:
      setState(() {
        error = 'Usuario no reconocido';
      });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Iniciar sesión')),
            const SizedBox(height: 10),
            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
