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
