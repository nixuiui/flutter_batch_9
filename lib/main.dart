import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_5/football_player_detail_page.dart';
import 'package:flutter_batch_9/pages/day_5/football_players_page.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/theme_cubit.dart';
import 'package:flutter_batch_9/pages/day_6/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeMode,
            initialRoute: '/main',
            routes: {
              '/main': (context) => const MainPage(),
              '/football-player-page': (context) => const FootballPlayersPage(),
              // Remove the detail page from routes if you want to pass data via Navigator
            },
            onGenerateRoute: (settings) {
              if (settings.name == '/football-player-detail-page') {
                final player = settings.arguments as Map<String, String>;
                return MaterialPageRoute(
                  builder: (context) => FootballPlayerDetailPage(
                    playerName: player['name']!,
                    clubName: player['club']!,
                  ),
                );
              }
              return null;
            },
          );
        }
      ),
    );
  }
}