import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

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
  ];

  final footballClubs = [
    'Inter Miami',
    'Al Nassr',
    'Al Hilal',
    'Paris Saint-Germain',
    'Manchester City',
    'Barcelona',
    'Liverpool',
    'Bayern Munich',
    'Retired',
    'Real Madrid',
    'Sevilla',
    'Juventus',
    'Chelsea',
    'Manchester United',
    'Tottenham Hotspur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: footballClubs.map((club) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(child: Text(club)),
              )).toList(),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "List Of Football Players", 
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 16),
                ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: footballPlayers.map((e) => ListTile(
                    leading: CircleAvatar(
                      child: Text(e['name']![0]),
                    ),
                    title: Text(e['name']!),
                    subtitle: Text(e['club']!),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}