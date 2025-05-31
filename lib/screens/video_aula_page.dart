import 'package:flutter/material.dart';

class VideoAulaPage extends StatelessWidget {
  const VideoAulaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _VideoCard(
            image: Image.asset(
              'assets/revolucao.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160,
            ),
            title: 'Revolução Francesa',
            subtitle: 'A Arte na Revolução Francesa\nJefferson dos Santos',
          ),
          _VideoCard(
            image: Image.asset(
              'assets/prehistoria.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160,
            ),
            title: 'Pré-História em 5 minutos!',
            subtitle: 'Escola em minutos',
          ),
        ],
      ),
    );
  }
}

class _VideoCard extends StatelessWidget {
  final Image image;
  final String title;
  final String subtitle;

  const _VideoCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              subtitle,
              style: const TextStyle(color: Color(0xFF555555)),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
