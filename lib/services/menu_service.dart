import '../models/platillo.dart';

class MenuService {
  static List<Platillo> getMenu() {
    return [
      Platillo(
        id: '1',
        nombre: 'Torta de Jamón',
        precio: 35.0,
        categoria: 'Tortas',
        imagen: '',
        descripcion: 'Torta de jamón con queso, aguacate y vegetales',
      ),
      Platillo(
        id: '2',
        nombre: 'Pizza Personal',
        precio: 45.0,
        categoria: 'Pizzas',
        imagen: '',
        descripcion: 'Pizza personal de pepperoni',
        enPromocion: true,
      ),
      Platillo(
        id: '3',
        nombre: 'Agua de Horchata',
        precio: 15.0,
        categoria: 'Bebidas',
        imagen: '',
        descripcion: 'Refrescante agua de horchata',
      ),
      Platillo(
        id: '4',
        nombre: 'Galletas',
        precio: 10.0,
        categoria: 'Postres',
        imagen: '',
        descripcion: 'Paquete de galletas',
      ),
      Platillo(
        id: '5',
        nombre: 'Tacos de Canasta',
        precio: 25.0,
        categoria: 'Tortas',
        imagen: '',
        descripcion: 'Orden de 3 tacos',
      ),
      Platillo(
        id: '6',
        nombre: 'Café Americano',
        precio: 20.0,
        categoria: 'Bebidas',
        imagen: '',
        descripcion: 'Café recién hecho',
      ),
    ];
  }
}