import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/menu_service.dart';
import '../widgets/platillo_card.dart';
import '../providers/carrito_provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menu = MenuService.getMenu();
    final categorias = menu.map((p) => p.categoria).toSet().toList();

    return DefaultTabController(
      length: categorias.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menú'),
          backgroundColor: Colors.orange,
          bottom: TabBar(
            tabs: categorias.map((cat) => Tab(text: cat)).toList(),
            isScrollable: true,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: BuscadorDelegate());
              },
            ),
          ],
        ),
        body: TabBarView(
          children: categorias.map((cat) {
            final platillosFiltrados = menu.where((p) => p.categoria == cat).toList();
            return ListView.builder(
              itemCount: platillosFiltrados.length,
              itemBuilder: (ctx, i) => PlatilloCard(platillo: platillosFiltrados[i]),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BuscadorDelegate extends SearchDelegate<String?> {
  final menu = MenuService.getMenu();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultados = menu.where((p) {
      return p.nombre.toLowerCase().contains(query.toLowerCase()) ||
          p.categoria.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (resultados.isEmpty) {
      return const Center(
        child: Text('No se encontraron productos'),
      );
    }

    return ListView.builder(
      itemCount: resultados.length,
      itemBuilder: (ctx, i) => PlatilloCard(platillo: resultados[i]),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugerencias = menu.where((p) {
      return p.nombre.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (query.isEmpty) {
      return const Center(
        child: Text('Escribe el nombre de un producto'),
      );
    }

    return ListView.builder(
      itemCount: sugerencias.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: const Icon(Icons.search),
        title: Text(sugerencias[i].nombre),
        subtitle: Text(sugerencias[i].categoria),
        onTap: () {
          query = sugerencias[i].nombre;
          showResults(context);
        },
      ),
    );
  }
}