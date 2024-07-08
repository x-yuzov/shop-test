import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('О нас'),
        ),
        body: const Center(child: Text('В разработке...')));
  }
}
