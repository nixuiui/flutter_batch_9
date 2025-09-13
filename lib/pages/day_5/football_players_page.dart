import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_5/football_player_detail_page.dart';

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
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: footballPlayers.length,
        itemBuilder: (context, index) {
          final e = footballPlayers[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(e['name']![0]),
            ),
            title: Text(e['name']!),
            subtitle: Text(e['club']!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              final result = await Navigator.push(context, MaterialPageRoute(
                builder: (context) => FootballPlayerDetailPage(
                  playerName: e['name']!, 
                  clubName: e['club']!
                ),
              ));
              if(result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result['liked'] == true ? 'You liked ${e['name']}' : 'You disliked ${e['name']}'),
                    duration: const Duration(seconds: 2),
                  )
                );
              }
            },
          );
        }
      )
    );
  }
}