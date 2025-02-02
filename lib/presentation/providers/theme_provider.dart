import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colres inmutable, por eso lleva provider y no stateprovider, no se puede cambiar

final colorListProvider = Provider((ref) => colorList);

// un int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// OBJT personalizado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
