// TC 5 - Parcial 3 - CAFETERIA CETIS 131
// Nombre: ESTRELLA LIZETH ESCAMILLA VARGAS
// Fecha: 13/05/2026
// Semestre: 6 Grupo: A Turno: VESPERTINO

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/carrito_provider.dart';
import 'providers/favoritos_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/carrito_screen.dart';
import 'screens/contacto_screen.dart';
import 'screens/detalle_platillo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
        ChangeNotifierProvider(create: (_) => FavoritosProvider()),
      ],
      child: MaterialApp(
        title: 'Cafetería CETis 131',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'Roboto',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/menu': (context) => const MenuScreen(),
          '/carrito': (context) => const CarritoScreen(),
          '/contacto': (context) => const ContactoScreen(),
          '/detalle': (context) => const DetallePlatilloScreen(),
        },
      ),
    );
  }
}
