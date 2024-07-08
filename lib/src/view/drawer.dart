import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Главная'),
            onTap: () {
              Navigator.pushNamed( context, '/main' );
            },
          ),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: const Text('Каталог'),
            onTap: () {
              Navigator.pushNamed( context, '/' );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Корзина'),
            onTap: () {
              Navigator.pushNamed( context, '/cart' );
            },
          ),
          Divider(),

          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text('О нас'),
            onTap: () {
              Navigator.pushNamed( context, '/about' );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text('Обратная связь'),
            onTap: () {
              Navigator.pushNamed( context, '/feedback' );
            },
          ),
        ],
      ),
    );
  }
}
