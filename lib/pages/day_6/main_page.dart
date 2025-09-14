import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_5/football_clubs_page.dart';
import 'package:flutter_batch_9/pages/day_5/football_players_page.dart';
import 'package:flutter_batch_9/pages/day_6/counter_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        FootballPlayersPage(),
        FootballClubsPage(),
        CounterPage(),
      ][index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Players'
          ),
          NavigationDestination(
            icon: Icon(Icons.shield),
            label: 'Clubs'
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Counter'
          ),
        ],
      ),
    );
  }
}