import 'package:flutter_batch_9/pages/day_6/bloc/favorite_player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePlayerCubit extends Cubit<FavoritePlayerState?> {
  FavoritePlayerCubit() : super(FavoritePlayerState());

  void addToFavorites(String playerName) {
    emit(state?.copyWith(playerNames: [
      ...?state?.playerNames, 
      playerName
    ]));
  }

  void removeFromFavorites(String playerName) {
    final updatedList = state?.playerNames?.where((name) => name != playerName).toList();
    emit(state?.copyWith(playerNames: updatedList));
  }

}