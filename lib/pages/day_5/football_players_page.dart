import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/favorite_player_cubit.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/favorite_player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FootballPlayersPage extends StatefulWidget {
  const FootballPlayersPage({super.key});

  @override
  State<FootballPlayersPage> createState() => _FootballPlayersPageState();
}

class _FootballPlayersPageState extends State<FootballPlayersPage> {

  final footballPlayers = [
    {'name': 'Lionel Messi', 'club': 'Inter Miami'},
    {'name': 'Cristiano Ronaldo', 'club': 'Al Nassr'},
    {'name': 'Neymar Jr.', 'club': 'Al Hilal'},
    {'name': 'Kylian Mbappe', 'club': 'Paris Saint-Germain'},
    {'name': 'Kevin De Bruyne', 'club': 'Manchester City'},
    {'name': 'Robert Lewandowski', 'club': 'Barcelona'},
    {'name': 'Virgil van Dijk', 'club': 'Liverpool'},
    {'name': 'Sadio Mane', 'club': 'Al Nassr'},
    {'name': 'Mohamed Salah', 'club': 'Liverpool'},
    {'name': 'Harry Kane', 'club': 'Bayern Munich'},
    {'name': 'Eden Hazard', 'club': 'Retired'},
    {'name': 'Luka Modric', 'club': 'Real Madrid'},
    {'name': 'Sergio Ramos', 'club': 'Sevilla'},
    {'name': 'Toni Kroos', 'club': 'Real Madrid'},
    {'name': 'Paul Pogba', 'club': 'Juventus'},
    {'name': 'Raheem Sterling', 'club': 'Chelsea'},
    {'name': 'Erling Haaland', 'club': 'Manchester City'},
    {'name': 'Jadon Sancho', 'club': 'Manchester United'},
    {'name': 'Bruno Fernandes', 'club': 'Manchester United'},
    {'name': 'Son Heung-min', 'club': 'Tottenham Hotspur'},
    {'name': 'Lionel Messi', 'club': 'Inter Miami'},
    {'name': 'Cristiano Ronaldo', 'club': 'Al Nassr'},
    {'name': 'Neymar Jr.', 'club': 'Al Hilal'},
    {'name': 'Kylian Mbappe', 'club': 'Paris Saint-Germain'},
    {'name': 'Kevin De Bruyne', 'club': 'Manchester City'},
    {'name': 'Robert Lewandowski', 'club': 'Barcelona'},
    {'name': 'Virgil van Dijk', 'club': 'Liverpool'},
    {'name': 'Sadio Mane', 'club': 'Al Nassr'},
    {'name': 'Mohamed Salah', 'club': 'Liverpool'},
    {'name': 'Harry Kane', 'club': 'Bayern Munich'},
    {'name': 'Eden Hazard', 'club': 'Retired'},
    {'name': 'Luka Modric', 'club': 'Real Madrid'},
    {'name': 'Sergio Ramos', 'club': 'Sevilla'},
    {'name': 'Toni Kroos', 'club': 'Real Madrid'},
    {'name': 'Paul Pogba', 'club': 'Juventus'},
    {'name': 'Raheem Sterling', 'club': 'Chelsea'},
    {'name': 'Erling Haaland', 'club': 'Manchester City'},
    {'name': 'Jadon Sancho', 'club': 'Manchester United'},
    {'name': 'Bruno Fernandes', 'club': 'Manchester United'},
    {'name': 'Son Heung-min', 'club': 'Tottenham Hotspur'},
    {'name': 'Lionel Messi', 'club': 'Inter Miami'},
    {'name': 'Cristiano Ronaldo', 'club': 'Al Nassr'},
    {'name': 'Neymar Jr.', 'club': 'Al Hilal'},
    {'name': 'Kylian Mbappe', 'club': 'Paris Saint-Germain'},
    {'name': 'Kevin De Bruyne', 'club': 'Manchester City'},
    {'name': 'Robert Lewandowski', 'club': 'Barcelona'},
    {'name': 'Virgil van Dijk', 'club': 'Liverpool'},
    {'name': 'Sadio Mane', 'club': 'Al Nassr'},
    {'name': 'Mohamed Salah', 'club': 'Liverpool'},
    {'name': 'Harry Kane', 'club': 'Bayern Munich'},
    {'name': 'Eden Hazard', 'club': 'Retired'},
    {'name': 'Luka Modric', 'club': 'Real Madrid'},
    {'name': 'Sergio Ramos', 'club': 'Sevilla'},
    {'name': 'Toni Kroos', 'club': 'Real Madrid'},
    {'name': 'Paul Pogba', 'club': 'Juventus'},
    {'name': 'Raheem Sterling', 'club': 'Chelsea'},
    {'name': 'Erling Haaland', 'club': 'Manchester City'},
    {'name': 'Jadon Sancho', 'club': 'Manchester United'},
    {'name': 'Bruno Fernandes', 'club': 'Manchester United'},
    {'name': 'Son Heung-min', 'club': 'Tottenham Hotspur'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Players'),
      ),
      body: ListView.builder(
        itemCount: footballPlayers.length,
        itemBuilder: (context, index) {
          final e = footballPlayers[index];
          return BlocBuilder<FavoritePlayerCubit, FavoritePlayerState?>(
            builder: (context, state) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(e['name']![0]),
                ),
                title: Text(e['name']!),
                subtitle: Text(e['club']!),
                trailing: Icon(
                  state?.playerNames?.contains(e['name']) == true  ? Icons.favorite : Icons.favorite_border,
                  color: state?.playerNames?.contains(e['name']) == true 
                    ? Colors.red 
                    : Colors.grey,
                ),
                onLongPress: () {
                  if(state?.playerNames?.contains(e['name']) == true) {
                    context.read<FavoritePlayerCubit>().removeFromFavorites(e['name'] ?? '');
                  } else {
                    context.read<FavoritePlayerCubit>().addToFavorites(e['name'] ?? '');
                  }
                },
                onTap: () async {
                  // final result = await Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => FootballPlayerDetailPage(
                  //     playerName: e['name']!, 
                  //     clubName: e['club']!
                  //   ),
                  // ));
                  final result = await Navigator.pushNamed(
                    context, 
                    '/football-player-detail-page', 
                    arguments: e
                  );
                  if(result != null) {
                    final res = result as Map<String, dynamic>;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(res['liked'] == true ? 'You liked ${e['name']}' : 'You disliked ${e['name']}'),
                        duration: const Duration(seconds: 2),
                      )
                    );
                  }
                },
              );
            }
          );
        }
      )
    );
  }
}