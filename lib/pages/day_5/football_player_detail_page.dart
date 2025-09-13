import 'package:flutter/material.dart';

class FootballPlayerDetailPage extends StatefulWidget {

  final String playerName;
  final String clubName;

  const FootballPlayerDetailPage({super.key, required this.playerName, required this.clubName});

  @override
  State<FootballPlayerDetailPage> createState() => _FootballPlayerDetailPageState();
}

class _FootballPlayerDetailPageState extends State<FootballPlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Player Detail'),
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Player Name: ${widget.playerName}'),
            Text('Club Name: ${widget.clubName}'),
            FilledButton(
              onPressed: () => Navigator.pop(context, {'liked': true}),
              child: const Text('Like')
            ),
            OutlinedButton(
              onPressed: () => Navigator.pop(context, {'liked': false}), 
              child: const Text('Dislike')
            ),
            OutlinedButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Back')
            ),
          ],
        ),
      ),
    );
  }
}