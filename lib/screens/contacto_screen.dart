import 'package:flutter/material.dart';

class ContactoScreen extends StatelessWidget {
  const ContactoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.contact_mail,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.school, color: Colors.orange),
                        title: const Text('CETis 131'),
                        subtitle: const Text('Plantel Naucalpan'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.location_on, color: Colors.orange),
                        title: const Text('Dirección'),
                        subtitle: const Text('Av. Ejemplo #123, Col. Centro, Naucalpan'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.phone, color: Colors.orange),
                        title: const Text('Teléfono'),
                        subtitle: const Text('55 1234 5678'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.email, color: Colors.orange),
                        title: const Text('Email'),
                        subtitle: const Text('cafeteria@cetis131.edu.mx'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.schedule, color: Colors.orange),
                        title: const Text('Horario'),
                        subtitle: const Text('Lunes a Viernes: 7:00 - 16:00 hrs'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}