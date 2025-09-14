import 'package:equatable/equatable.dart';

class FavoritePlayerState extends Equatable {
  final List<String>? playerNames;

  const FavoritePlayerState({this.playerNames});

  FavoritePlayerState copyWith({List<String>? playerNames}) {
    return FavoritePlayerState(
      playerNames: playerNames ?? this.playerNames,
    );
  }

  @override
  List<Object?> get props => [playerNames];
}