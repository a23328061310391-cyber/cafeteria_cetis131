class Platillo {
  final String id;
  final String nombre;
  final double precio;
  final String categoria;
  final String imagen;
  final bool enPromocion;
  final String? descripcion;

  Platillo({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
    required this.imagen,
    this.enPromocion = false,
    this.descripcion,
  });
}