import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/platillo.dart';
import '../providers/carrito_provider.dart';
import '../providers/favoritos_provider.dart';

class PlatilloCard extends StatelessWidget {
  final Platillo platillo;

  const PlatilloCard({Key? key, required this.platillo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoProvider>(context);
    final favoritos = Provider.of<FavoritosProvider>(context);
    final cantidadEnCarrito = carrito.cantidadDe(platillo);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detalle',
            arguments: platillo,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Hero(
                tag: 'imagen_${platillo.id}',
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.fastfood, size: 30),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      platillo.nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$${platillo.precio.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (platillo.enPromocion)
                      const Chip(
                        label: Text('Promoción'),
                        backgroundColor: Colors.red,
                        labelStyle: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  favoritos.esFavorito(platillo.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => favoritos.toggleFavorito(platillo),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => carrito.remover(platillo),
                  ),
                  Text(
                    cantidadEnCarrito.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => carrito.agregar(platillo),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}