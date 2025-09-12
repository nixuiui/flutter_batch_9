import 'package:flutter/material.dart';

class GridViewBuilderPage extends StatefulWidget {
  const GridViewBuilderPage({super.key});

  @override
  State<GridViewBuilderPage> createState() => _GridViewBuilderPageState();
}

class _GridViewBuilderPageState extends State<GridViewBuilderPage> {

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
        title: const Text('GridView'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: footballPlayers.length,
        itemBuilder: (context, index) {
          final e = footballPlayers[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Text(
                    e['name']?.substring(0, 1) ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(e['name']?.split(' ').first ?? '', textAlign: TextAlign.center),
              ],
            ),
          );
        }
      )
    );
  }
}