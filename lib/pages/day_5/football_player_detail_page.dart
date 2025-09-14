import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/favorite_player_cubit.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/favorite_player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        actions: [
          BlocBuilder<FavoritePlayerCubit, FavoritePlayerState?>(
            builder: (context, state) {
              final isFavorite = state?.playerNames?.contains(widget.playerName) == true;
              return IconButton(
                icon: Icon(
                  isFavorite  ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                    ? Colors.red
                    : Colors.grey,
                ),
                onPressed: () {
                  if(isFavorite) {
                    context.read<FavoritePlayerCubit>().removeFromFavorites(widget.playerName);
                  } else {
                    context.read<FavoritePlayerCubit>().addToFavorites(widget.playerName);
                  }
                }, 
              );
            }
          )
        ],
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