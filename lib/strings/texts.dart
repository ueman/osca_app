import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Texts {
  static Future<Texts> load(Locale locale) async {
    return Texts();
  }

  static Texts of(BuildContext context) {
    return Localizations.of<Texts>(context, Texts);
  }

  static String appName = 'MyHSOS';

  String master = 'Master';
  String bachelor = 'Bachelor';
  String studium = 'Studium gesamt';

  String averageGrade(double grade) =>
      'Durchschnittsnote: ${grade.toStringAsFixed(2)}';

  String averageGradeDescription =
      'Dies ist eine ungewichtete Durchschnittsnote.';

  String averageGradeForNextSemester(double grade) =>
      'Durchschnittsnote für das nächste Semester: ${grade.toStringAsFixed(2)}';

  String averageGradeCalculationDescription =
      'Die Vorhersage wurde mittels Linearer Regression ausgerechnet. '
      'Grundlage für die Berechnung waren die Durchschnittsnoten und die '
      'durchschnittliche Dauer der belegten Kurse.';

  String ok = 'Ok';

  String gradePieChartTitle = 'Welche Note du wie oft geschrieben hast';
  String weekhourGraphTitle = 'Wochenstunden pro Semester';
  String gradeGraphTitle = 'Durchschnittsnote pro Semester';
}

class TextsDelegate extends LocalizationsDelegate<Texts> {
  const TextsDelegate();

  @override
  bool isSupported(Locale locale) => ['de'].contains(locale.languageCode);

  @override
  Future<Texts> load(Locale locale) {
    return SynchronousFuture<Texts>(Texts());
  }

  @override
  bool shouldReload(TextsDelegate old) => false;
}
