import 'package:flutter/material.dart';

ThemeData getTheme([String? fontFamily = 'SCDream']) {
  const colorScheme = lightColorScheme;
  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    fontFamily: fontFamily,
    hintColor: const Color(0xFF999999),
  );
  return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        color: theme.scaffoldBackgroundColor,
        // systemOverlayStyle: DynamicSystemUiOverlayStyle.dark,
        // backgroundColor: theme.scaffoldBackgroundColor,
        // surfaceTintColor: Colors.transparent,
        // elevation: 0,
        centerTitle: true,
        titleTextStyle: theme.textColor.semiBold(16)
      ),
      cardTheme: theme.cardTheme.copyWith(
        color: theme.scaffoldBackgroundColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      dialogBackgroundColor: theme.scaffoldBackgroundColor,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(4),
            foregroundColor: theme.colorScheme.onSurface,
            // textStyle: theme.textColor.normal(14),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
          )
      ),
      dividerTheme:
      DividerThemeData(color: theme.dividerColor, space: 1, thickness: 1),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            foregroundColor: theme.colorScheme.onPrimary,
            backgroundColor: theme.colorScheme.primary,
            disabledBackgroundColor: theme.dividerColor,
            disabledForegroundColor: theme.colorScheme.onPrimary,
            elevation: 0,
            textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        labelStyle:
        theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        helperStyle:
        theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        prefixIconColor: theme.hintColor,
        suffixIconColor: theme.hintColor,
      ),
      checkboxTheme: theme.checkboxTheme.copyWith(
          side: BorderSide(width: 1, color: theme.colorScheme.outline)),
      dialogTheme: theme.dialogTheme.copyWith(
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: theme.scaffoldBackgroundColor,
        elevation: 8,
        // titleTextStyle: theme.textColor.bold(20),
        // contentTextStyle: theme.hintColor.normal(16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
          backgroundColor: theme.scaffoldBackgroundColor,
          surfaceTintColor: theme.scaffoldBackgroundColor,
          elevation: 8,
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          )),
      extensions: [

      ]);
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF14C8AA),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE1F1FF),
  onPrimaryContainer: Color(0xFF007AFF),
  secondary: Color(0xFF00B3CC),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE7FAEE),
  onSecondaryContainer: Color(0xFF34C759),
  tertiary: Color(0xFFFF9500),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFF4E3),
  onTertiaryContainer: Color(0xFFFF9500),
  error: Color(0xFFFF3B30),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFEAEA),
  onErrorContainer: Color(0xFFFF3B30),
  outline: Color(0xFFEEEEEE),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF111111),
  surface: Color(0xFFFCF8FF),
  onSurface: Color(0xFF000000),
  // Text Color
  surfaceVariant: Color(0xFFE5E1EC),
  onSurfaceVariant: Color(0xFF47464F),
  inverseSurface: Color(0xFF313036),
  onInverseSurface: Color(0xFFF3EFF7),
  inversePrimary: Color(0xFFC5C0FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5C5698),
  outlineVariant: Color(0xFFC8C5D0),
  scrim: Color(0xFF000000),
);

extension TextStyleByTheme on ThemeData {
  Color get textColor => colorScheme.onSurface;

  Color get primaryTextColor => colorScheme.onPrimary;

  Color get secondTextColor => colorScheme.onSecondary;

  Color get tertiaryTextColor => colorScheme.onTertiary;

  Color get errorTextColor => colorScheme.onError;
}

extension DynamicTextStyleByColor on Color {
  TextStyle w100(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w100,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w200(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w200,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w300(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w300,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w400(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w400,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w500(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w500,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w600(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w600,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w700(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w700,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w800(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w800,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w900(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w900,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle normal(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return w400(
      fontSize,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle semiBold(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return w600(
      fontSize,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle bold(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return w700(
      fontSize,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}

extension AppButtonStyle on ButtonThemeData {
  ButtonStyle get disableStyle => ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Color(0xff868e96)),
      backgroundColor: const MaterialStatePropertyAll(Color(0xFFf1f3f5)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ))
  );

  ButtonStyle get transparentStyle => ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  ButtonStyle get cancelStyle => ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.black),
      backgroundColor:
      const MaterialStatePropertyAll(Color(0xFFFFFFFF)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
              color: Color(0xffe9ecef),
              width: 1
          )
      ))
  );
}