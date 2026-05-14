import '../models/platillo.dart';

class MenuService {
  static List<Platillo> getMenu() {
    List<Platillo> menu = [];
    
    // ========== TORTAS (10 platillos) con imágenes únicas ==========
    List<Map<String, String>> tortas = [
      {'nombre': 'Torta de Jamón', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Pierna', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Cochinita', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Milanesa', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Chorizo', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Queso', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Huevo', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta de Chilaquiles', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta Cubana', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Torta Hawaiana', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
    ];
    
    for (int i = 0; i < tortas.length; i++) {
      menu.add(Platillo(
        id: 'torta_${i+1}',
        nombre: tortas[i]['nombre']!,
        precio: 35.0,
        categoria: 'Tortas',
        imagen: tortas[i]['img']!,
        descripcion: 'Deliciosa ${tortas[i]['nombre']} preparada al momento',
        enPromocion: i < 2,
      ));
    }
    
    // ========== PIZZAS (10 platillos) con imágenes únicas ==========
    List<Map<String, String>> pizzas = [
      {'nombre': 'Pizza Pepperoni', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Hawaiana', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Mexicana', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Cuatro Quesos', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Vegetariana', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Carnes Frías', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza de Pollo', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza de Champiñones', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Margarita', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pizza Barbacoa', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
    ];
    
    for (int i = 0; i < pizzas.length; i++) {
      menu.add(Platillo(
        id: 'pizza_${i+1}',
        nombre: pizzas[i]['nombre']!,
        precio: 45.0,
        categoria: 'Pizzas',
        imagen: pizzas[i]['img']!,
        descripcion: 'Pizza ${pizzas[i]['nombre']} con ingredientes frescos',
        enPromocion: i == 0,
      ));
    }
    
    // ========== BEBIDAS (10 platillos) con imágenes únicas ==========
    List<Map<String, String>> bebidas = [
      {'nombre': 'Agua de Horchata', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Agua de Jamaica', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Agua de Limón', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Agua de Naranja', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Café Americano', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Café de Olla', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Chocolate Caliente', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Atole de Vainilla', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Licuado de Fresa', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Licuado de Mango', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
    ];
    
    for (int i = 0; i < bebidas.length; i++) {
      menu.add(Platillo(
        id: 'bebida_${i+1}',
        nombre: bebidas[i]['nombre']!,
        precio: 15.0,
        categoria: 'Bebidas',
        imagen: bebidas[i]['img']!,
        descripcion: 'Refrescante ${bebidas[i]['nombre']} preparada al momento',
        enPromocion: i < 2,
      ));
    }
    
    // ========== POSTRES (10 platillos) con imágenes únicas ==========
    List<Map<String, String>> postres = [
      {'nombre': 'Galletas', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pastel de Chocolate', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pastel de Vainilla', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Pay de Queso', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Flan Napolitano', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Arroz con Leche', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Gelatina de Fresa', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Fresas con Crema', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Brownie', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Panqué de Nuez', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
    ];
    
    for (int i = 0; i < postres.length; i++) {
      menu.add(Platillo(
        id: 'postre_${i+1}',
        nombre: postres[i]['nombre']!,
        precio: 10.0,
        categoria: 'Postres',
        imagen: postres[i]['img']!,
        descripcion: 'Delicioso ${postres[i]['nombre']} para endulzar tu día',
        enPromocion: i < 2,
      ));
    }
    
    // ========== GUARNICIONES (10 platillos) con imágenes únicas ==========
    List<Map<String, String>> guarniciones = [
      {'nombre': 'Papas Fritas', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Aros de Cebolla', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Nuggets de Pollo', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Dedos de Queso', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Tostadas', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Elotes', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Esquites', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Chicharrón Preparado', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Hot Dog', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
      {'nombre': 'Hamburguesa Sencilla', 'img': 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png'},
    ];
    
    for (int i = 0; i < guarniciones.length; i++) {
      menu.add(Platillo(
        id: 'guarnicion_${i+1}',
        nombre: guarniciones[i]['nombre']!,
        precio: 20.0,
        categoria: 'Guarniciones',
        imagen: guarniciones[i]['img']!,
        descripcion: 'Ricas ${guarniciones[i]['nombre']} para acompañar',
      ));
    }
    
    return menu;
  }
}
