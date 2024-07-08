import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key, this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Обратная связь'),
        ),
        body: const Center(child: Text('В разработке...')));
  }
}
