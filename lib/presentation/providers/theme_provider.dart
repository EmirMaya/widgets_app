import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colres inmutable, por eso lleva provider y no stateprovider, no se puede cambiar

final colorListProvider = Provider((ref) => colorList);
