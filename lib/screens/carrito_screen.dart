import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carrito_provider.dart';
import '../services/menu_service.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoProvider>(context);
    final menu = MenuService.getMenu();

    final items = menu.where((p) => carrito.cantidadDe(p) > 0).toList();

    double subtotal = 0;
    for (var p in items) {
      subtotal += p.precio * carrito.cantidadDe(p);
    }
    double descuento = subtotal > 100 ? subtotal * 0.10 : 0;
    double total = subtotal - descuento;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Carrito'),
        backgroundColor: Colors.orange,
        actions: [
          if (items.isNotEmpty)
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Limpiar carrito'),
                    content: const Text('¿Eliminar todos los productos?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          carrito.limpiarCarrito();
                          Navigator.pop(ctx);
                        },
                        child: const Text('Limpiar'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete_sweep),
              label: const Text('Limpiar'),
            ),
        ],
      ),
      body: items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'Tu carrito está vacío',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (ctx, i) {
                      final p = items[i];
                      final cantidad = carrito.cantidadDe(p);
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.fastfood),
                          ),
                          title: Text(p.nombre),
                          subtitle: Text('\$${p.precio} x $cantidad'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => carrito.remover(p),
                              ),
                              Text(
                                cantidad.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => carrito.agregar(p),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Subtotal:'),
                          Text('\$${subtotal.toStringAsFixed(2)}'),
                        ],
                      ),
                      if (descuento > 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Descuento (10%):'),
                            Text(
                              '-\$${descuento.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('¡Pedido Confirmado!'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.check_circle,
                                        size: 60, color: Colors.green),
                                    const SizedBox(height: 10),
                                    Text('Gracias por tu compra'),
                                    Text('Total pagado: \$${total.toStringAsFixed(2)}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      carrito.limpiarCarrito();
                                      Navigator.pop(ctx);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Aceptar'),
                                  ),
                                ],
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
                            'Confirmar Pedido',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}