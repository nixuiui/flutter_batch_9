import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_5/football_player_detail_page.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/favorite_player_cubit.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/theme_cubit.dart';
import 'package:flutter_batch_9/pages/day_7/data/local_storage/theme_local_storage.dart';
import 'package:flutter_batch_9/pages/day_7/pages/product_page.dart';
import 'package:flutter_batch_9/pages/singleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupSingleton();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(ThemeLocalStorage(getIt()))..loadTheme(),
        ),
        BlocProvider<FavoritePlayerCubit>(
          create: (context) => FavoritePlayerCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeMode,
            home: const ProductPage(),
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