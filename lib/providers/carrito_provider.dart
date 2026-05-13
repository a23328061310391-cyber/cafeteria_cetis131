import 'package:flutter/foundation.dart';
import '../models/platillo.dart';

class CarritoProvider extends ChangeNotifier {
  Map<String, int> _items = {};

  Map<String, int> get items => _items;

  int get cantidadTotal {
    return _items.values.fold(0, (sum, cantidad) => sum + cantidad);
  }

  void agregar(Platillo platillo) {
    if (_items.containsKey(platillo.id)) {
      _items[platillo.id] = _items[platillo.id]! + 1;
    } else {
      _items[platillo.id] = 1;
    }
    notifyListeners();
  }

  void remover(Platillo platillo) {
    if (_items.containsKey(platillo.id)) {
      if (_items[platillo.id]! > 1) {
        _items[platillo.id] = _items[platillo.id]! - 1;
      } else {
        _items.remove(platillo.id);
      }
      notifyListeners();
    }
  }

  void limpiarCarrito() {
    _items.clear();
    notifyListeners();
  }

  int cantidadDe(Platillo platillo) {
    return _items[platillo.id] ?? 0;
  }
}