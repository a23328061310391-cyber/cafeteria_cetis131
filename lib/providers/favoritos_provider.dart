import 'package:flutter/foundation.dart';
import '../models/platillo.dart';

class FavoritosProvider extends ChangeNotifier {
  Set<String> _favoritosIds = {};

  Set<String> get favoritosIds => _favoritosIds;

  bool esFavorito(String id) => _favoritosIds.contains(id);

  void toggleFavorito(Platillo platillo) {
    if (_favoritosIds.contains(platillo.id)) {
      _favoritosIds.remove(platillo.id);
    } else {
      _favoritosIds.add(platillo.id);
    }
    notifyListeners();
  }
}