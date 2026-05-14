import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/platillo.dart';
import '../providers/carrito_provider.dart';
import '../providers/favoritos_provider.dart';

class DetallePlatilloScreen extends StatelessWidget {
  const DetallePlatilloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platillo = ModalRoute.of(context)!.settings.arguments as Platillo;
    final carrito = Provider.of<CarritoProvider>(context);
    final favoritos = Provider.of<FavoritosProvider>(context);
    final cantidad = carrito.cantidadDe(platillo);

    return Scaffold(
      appBar: AppBar(
        title: Text(platillo.nombre),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(
              favoritos.esFavorito(platillo.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () => favoritos.toggleFavorito(platillo),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'imagen_${platillo.id}',
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: platillo.imagen.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(platillo.imagen),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: platillo.imagen.isEmpty ? Colors.orange[100] : null,
                ),
                child: platillo.imagen.isEmpty
                    ? const Icon(
                        Icons.fastfood,
                        size: 100,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platillo.nombre,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (platillo.enPromocion)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '🔥 EN PROMOCIÓN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  const SizedBox(height: 15),
                  Text(
                    platillo.descripcion ?? 'Delicioso platillo de nuestra cafetería',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Precio',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '\$${platillo.precio.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () => carrito.remover(platillo),
                              iconSize: 40,
                            ),
                            Text(
                              cantidad.toString(),
                              style: const TextStyle(fontSize: 24),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle),
                              onPressed: () => carrito.agregar(platillo),
                              iconSize: 40,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        carrito.agregar(platillo);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${platillo.nombre} agregado al carrito'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Agregar al Carrito',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
