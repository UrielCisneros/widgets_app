import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Provier que controla si esta en modo oscuro o no
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Provider que maneja el color seleccionado
final indexColorSelectedProvider = StateProvider<int>((ref) => 0);

//Provider de la lista de colores, esta no se puede cambiar
//Lista de colores que nunca va a cambiar (inmutable)
final colorListProvider = Provider<List<Color>>((ref) => colorList);

//Provider que va a instanciar la clase AppTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Clase que controla al themeNotifierProvider
class ThemeNotifier extends StateNotifier<AppTheme> {
  //Aquin se crea una nueva instancia del appTheme
  ThemeNotifier() : super(AppTheme());

  //Cambio a modo oscuro
  void toggleDarkMode() {
    //Aqui se le da al "state" el nuevo AppTheme (gracias al copyWith) con los nuevos dato.
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorindex(int colorSelected) {
    state = state.copyWith(selectColor: colorSelected);
  }
}
