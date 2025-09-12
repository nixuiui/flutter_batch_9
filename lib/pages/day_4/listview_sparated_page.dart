import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatefulWidget {
  const ListViewSeparatedPage({super.key});

  @override
  State<ListViewSeparatedPage> createState() => _ListViewSeparatedPageState();
}

class _ListViewSeparatedPageState extends State<ListViewSeparatedPage> {

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
      body: ListView.separated(
        itemCount: footballPlayers.length,
        separatorBuilder: (context, index) => Container(
          height: index%5 == 0 ? 20 : 1,
          color: Colors.blue,
          child: const Center(
            child: Text('Separator', style: TextStyle(color: Colors.white),),
          ),
        ),
        itemBuilder: (context, index) {
          final e = footballPlayers[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(e['name']![0]),
            ),
            title: Text(e['name']!),
            subtitle: Text(e['club']!),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        }
      )
    );
  }
}