import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FootballClubsPage extends StatefulWidget {
  const FootballClubsPage({super.key});

  @override
  State<FootballClubsPage> createState() => _FootballClubsPageState();
}

class _FootballClubsPageState extends State<FootballClubsPage> {

  final footballClubs = [
    {'club': 'Inter Miami', 'country': 'USA'},
    {'club': 'Al Nassr', 'country': 'Saudi Arabia'},
    {'club': 'Al Hilal', 'country': 'Saudi Arabia'},
    {'club': 'Paris Saint-Germain', 'country': 'France'},
    {'club': 'Manchester City', 'country': 'England'},
    {'club': 'Barcelona', 'country': 'Spain'},
    {'club': 'Liverpool', 'country': 'England'},
    {'club': 'Bayern Munich', 'country': 'Germany'},
    {'club': 'Retired', 'country': '-'},
    {'club': 'Real Madrid', 'country': 'Spain'},
    {'club': 'Sevilla', 'country': 'Spain'},
    {'club': 'Juventus', 'country': 'Italy'},
    {'club': 'Chelsea', 'country': 'England'},
    {'club': 'Manchester United', 'country': 'England'},
    {'club': 'Tottenham Hotspur', 'country': 'England'},
  ];

  final footballClubsDivision = [
    {'club': 'Real Madrid', 'division': 'La Liga'},
    {'club': 'Barcelona', 'division': 'La Liga'},
    {'club': 'Atletico Madrid', 'division': 'La Liga'},
    {'club': 'Sevilla', 'division': 'La Liga'},
    {'club': 'Valencia', 'division': 'La Liga'},
    {'club': 'Villarreal', 'division': 'La Liga'},
    {'club': 'Real Sociedad', 'division': 'La Liga'},
    {'club': 'Real Betis', 'division': 'La Liga'},
    {'club': 'Athletic Bilbao', 'division': 'La Liga'},
    {'club': 'Celta Vigo', 'division': 'La Liga'},
    {'club': 'Espanyol', 'division': 'La Liga'},
    {'club': 'Getafe', 'division': 'La Liga'},
    {'club': 'Granada', 'division': 'La Liga'},
    {'club': 'Mallorca', 'division': 'La Liga'},
    {'club': 'Osasuna', 'division': 'La Liga'},
    {'club': 'Rayo Vallecano', 'division': 'La Liga'},
    {'club': 'Almeria', 'division': 'La Liga'},
    {'club': 'Cadiz', 'division': 'La Liga'},
    {'club': 'Elche', 'division': 'La Liga'},
    {'club': 'Girona', 'division': 'La Liga'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Football Clubs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'By Country'),
              Tab(text: 'By Division'),
            ],
          ),
          actions: [
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return Switch(
                  value: themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  }
                );
              }
            )
          ],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: footballClubs.length,
              itemBuilder: (context, index) {
                final e = footballClubs[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(e['club']![0]),
                  ),
                  title: Text(e['club']!),
                  subtitle: Text(e['country']!),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              }
            ),
            ListView.builder(
              itemCount: footballClubsDivision.length,
              itemBuilder: (context, index) {
                final e = footballClubsDivision[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(e['club']![0]),
                  ),
                  title: Text(e['club']!),
                  subtitle: Text(e['division']!),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              }
            )
          ]
        )
      ),
    );
  }
}