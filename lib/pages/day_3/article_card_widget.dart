import 'package:flutter/material.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxLoJONSCCuN_JBwM_xVD5hloPBf4pHB9R7A&s',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            'Exploring the Wonders of the Universe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Discover the mysteries of space and time in this fascinating article about the cosmos.',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Read More'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Read More'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}