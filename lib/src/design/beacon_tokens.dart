import 'package:flutter/material.dart';

@immutable
class BeaconPalette extends ThemeExtension<BeaconPalette> {
  const BeaconPalette({
    required this.bgBase,
    required this.bgSurface,
    required this.bgSurfaceRaised,
    required this.bgSunken,
    required this.accentDefault,
    required this.accentHover,
    required this.accentSubtle,
    required this.secondaryDefault,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.borderHairline,
    required this.borderStrong,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
  });

  final Color bgBase;
  final Color bgSurface;
  final Color bgSurfaceRaised;
  final Color bgSunken;
  final Color accentDefault;
  final Color accentHover;
  final Color accentSubtle;
  final Color secondaryDefault;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color borderHairline;
  final Color borderStrong;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  static const light = BeaconPalette(
    bgBase: Color(0xFFFAF9F6),
    bgSurface: Color(0xFFFFFFFF),
    bgSurfaceRaised: Color(0xFFFFFFFF),
    bgSunken: Color(0xFFF1EFE9),
    accentDefault: Color(0xFFE8A23D),
    accentHover: Color(0xFFD6912E),
    accentSubtle: Color(0xFFFCEFD9),
    secondaryDefault: Color(0xFF5E7183),
    textPrimary: Color(0xFF1C1A17),
    textSecondary: Color(0xFF5C5852),
    textMuted: Color(0xFF8C8880),
    borderHairline: Color(0x141C1A17),
    borderStrong: Color(0x2E1C1A17),
    success: Color(0xFF4C7A4E),
    warning: Color(0xFFB8842E),
    error: Color(0xFFB4453A),
    info: Color(0xFF5E7183),
  );

  static const dark = BeaconPalette(
    bgBase: Color(0xFF121110),
    bgSurface: Color(0xFF1B1A18),
    bgSurfaceRaised: Color(0xFF211F1D),
    bgSunken: Color(0xFF0C0B0A),
    accentDefault: Color(0xFFF0B15A),
    accentHover: Color(0xFFF5BE71),
    accentSubtle: Color(0xFF3A2E17),
    secondaryDefault: Color(0xFF8FA0AF),
    textPrimary: Color(0xFFF2F0EC),
    textSecondary: Color(0xFFB8B4AC),
    textMuted: Color(0xFF7A766E),
    borderHairline: Color(0x1AF2F0EC),
    borderStrong: Color(0x38F2F0EC),
    success: Color(0xFF7FB07E),
    warning: Color(0xFFD6A24E),
    error: Color(0xFFD97066),
    info: Color(0xFF8FA0AF),
  );

  @override
  ThemeExtension<BeaconPalette> copyWith({
    Color? bgBase,
    Color? bgSurface,
    Color? bgSurfaceRaised,
    Color? bgSunken,
    Color? accentDefault,
    Color? accentHover,
    Color? accentSubtle,
    Color? secondaryDefault,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? borderHairline,
    Color? borderStrong,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
  }) {
    return BeaconPalette(
      bgBase: bgBase ?? this.bgBase,
      bgSurface: bgSurface ?? this.bgSurface,
      bgSurfaceRaised: bgSurfaceRaised ?? this.bgSurfaceRaised,
      bgSunken: bgSunken ?? this.bgSunken,
      accentDefault: accentDefault ?? this.accentDefault,
      accentHover: accentHover ?? this.accentHover,
      accentSubtle: accentSubtle ?? this.accentSubtle,
      secondaryDefault: secondaryDefault ?? this.secondaryDefault,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      borderHairline: borderHairline ?? this.borderHairline,
      borderStrong: borderStrong ?? this.borderStrong,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
    );
  }

  @override
  ThemeExtension<BeaconPalette> lerp(
    covariant ThemeExtension<BeaconPalette>? other,
    double t,
  ) {
    if (other is! BeaconPalette) return this;
    return BeaconPalette(
      bgBase: Color.lerp(bgBase, other.bgBase, t)!,
      bgSurface: Color.lerp(bgSurface, other.bgSurface, t)!,
      bgSurfaceRaised: Color.lerp(bgSurfaceRaised, other.bgSurfaceRaised, t)!,
      bgSunken: Color.lerp(bgSunken, other.bgSunken, t)!,
      accentDefault: Color.lerp(accentDefault, other.accentDefault, t)!,
      accentHover: Color.lerp(accentHover, other.accentHover, t)!,
      accentSubtle: Color.lerp(accentSubtle, other.accentSubtle, t)!,
      secondaryDefault: Color.lerp(secondaryDefault, other.secondaryDefault, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      borderHairline: Color.lerp(borderHairline, other.borderHairline, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}

abstract final class BeaconSpacing {
  static const double x1 = 4;
  static const double x2 = 8;
  static const double x3 = 12;
  static const double x4 = 16;
  static const double x5 = 20;
  static const double x6 = 24;
  static const double x8 = 32;
  static const double x10 = 40;
  static const double x12 = 48;
  static const double x16 = 64;
}

abstract final class BeaconRadii {
  static const double sm = 6;
  static const double md = 10;
  static const double lg = 16;
  static const double bubble = 14;
  static const double bubbleTail = 4;
}

abstract final class BeaconElevation {
  static const List<BoxShadow> level0 = <BoxShadow>[];
  static const List<BoxShadow> level1 = <BoxShadow>[
    BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 2)),
  ];
  static const List<BoxShadow> level2 = <BoxShadow>[
    BoxShadow(color: Color(0x24000000), blurRadius: 24, offset: Offset(0, 8)),
  ];
}

extension BeaconThemeTokens on BuildContext {
  BeaconPalette get palette => Theme.of(this).extension<BeaconPalette>()!;
}
