import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_7/data/local_storage/theme_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {

  final ThemeLocalStorage _themeLocalStorage;

  ThemeCubit(this._themeLocalStorage) : super(ThemeMode.light);

  void loadTheme() {
    final themeMode = _themeLocalStorage.getThemeMode();
    emit(themeMode);
  }

  void toggleTheme() {
    _themeLocalStorage.setThemeMode(
      state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light
    );
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

}