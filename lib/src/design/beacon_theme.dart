import 'package:flutter/material.dart';

import 'beacon_tokens.dart';

abstract final class BeaconFonts {
  static const String body = 'Inter';
  static const String heading = 'General Sans';
  static const String mono = 'IBM Plex Mono';
}

class BeaconTheme {
  static ThemeData light() => _build(Brightness.light, BeaconPalette.light);
  static ThemeData dark() => _build(Brightness.dark, BeaconPalette.dark);

  static ThemeData _build(Brightness brightness, BeaconPalette palette) {
    final textTheme = _textTheme(palette);
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: palette.accentDefault,
      onPrimary: BeaconPalette.light.textPrimary,
      secondary: palette.secondaryDefault,
      onSecondary: palette.bgSurface,
      error: palette.error,
      onError: palette.bgSurface,
      surface: palette.bgSurface,
      onSurface: palette.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: palette.bgBase,
      fontFamily: BeaconFonts.body,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[palette],
      dividerTheme: DividerThemeData(color: palette.borderHairline, thickness: 1, space: 1),
      iconTheme: IconThemeData(color: palette.textSecondary, size: 20),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: palette.bgSurface,
        foregroundColor: palette.textPrimary,
        titleTextStyle: textTheme.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: palette.accentDefault,
          foregroundColor: BeaconPalette.light.textPrimary,
          disabledBackgroundColor: palette.accentDefault.withValues(alpha: .4),
          disabledForegroundColor: BeaconPalette.light.textPrimary.withValues(alpha: .4),
          textStyle: textTheme.labelLarge,
          minimumSize: const Size(44, 44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BeaconRadii.md)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.textPrimary,
          side: BorderSide(color: palette.borderStrong, width: 1.5),
          textStyle: textTheme.labelLarge,
          minimumSize: const Size(44, 44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BeaconRadii.md)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.bgSunken,
        hintStyle: textTheme.bodyMedium?.copyWith(color: palette.textMuted),
        contentPadding: const EdgeInsets.symmetric(horizontal: BeaconSpacing.x4, vertical: BeaconSpacing.x3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(BeaconRadii.sm), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BeaconRadii.sm),
          borderSide: BorderSide(color: palette.accentDefault, width: 1.5),
        ),
      ),
    );
  }

  static TextTheme _textTheme(BeaconPalette palette) {
    return TextTheme(
      displaySmall: TextStyle(fontFamily: BeaconFonts.heading, fontSize: 28, fontWeight: FontWeight.w600, height: 1.25, color: palette.textPrimary),
      titleLarge: TextStyle(fontFamily: BeaconFonts.heading, fontSize: 20, fontWeight: FontWeight.w600, height: 1.3, color: palette.textPrimary),
      titleMedium: TextStyle(fontFamily: BeaconFonts.heading, fontSize: 16, fontWeight: FontWeight.w600, height: 1.35, color: palette.textPrimary),
      bodyLarge: TextStyle(fontFamily: BeaconFonts.body, fontSize: 15, fontWeight: FontWeight.w400, height: 1.5, color: palette.textPrimary),
      bodyMedium: TextStyle(fontFamily: BeaconFonts.body, fontSize: 14, fontWeight: FontWeight.w500, height: 1.4, color: palette.textPrimary),
      bodySmall: TextStyle(fontFamily: BeaconFonts.body, fontSize: 13, fontWeight: FontWeight.w400, height: 1.4, color: palette.textSecondary),
      labelSmall: TextStyle(fontFamily: BeaconFonts.mono, fontSize: 12, fontWeight: FontWeight.w400, height: 1.4, color: palette.textSecondary),
      labelLarge: TextStyle(fontFamily: BeaconFonts.body, fontSize: 14, fontWeight: FontWeight.w500, height: 1, color: palette.textPrimary),
    );
  }
}
