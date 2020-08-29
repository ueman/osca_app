import 'dart:math';

import 'package:hsos/exams/stats/service/grade_prediction.dart';

/// The [LinearRegression] class performs a simple linear regression
/// on an set of n data points (y_i, x_i).
/// That is, it fits a straight line y = &alpha; + &beta; x,
/// (where y is the response variable, x is the predictor variable,
/// &alpha; is the y-intercept, and &beta; is the slope)
/// that minimizes the sum of squared residuals of the linear regression model.
/// It also computes associated statistics, including the coefficient of
/// determination R_2 and the standard deviation of the
/// estimates for the slope and y-intercept.
///
/// Siehe auch: https://de.wikipedia.org/wiki/Lineare_Regression
class LinearRegression {
  // ignore: comment_references
  /// Performs a linear regression on the data points (y[i], x[i])}.
  ///
  ///[x] the values of the predictor variable
  ///[y] the corresponding values of the response variable
  ///Throws Exception if the lengths of the two arrays are not equal
  LinearRegression(List<double> x, List<double> y)
      : assert(x.length == y.length) {
    final n = x.length;

    // first pass
    var sumx = 0.0;
    var sumy = 0.0;
    var sumx2 = 0.0;
    for (int i = 0; i < n; i++) {
      sumx += x[i];
      sumx2 += x[i] * x[i];
      sumy += y[i];
    }
    final xbar = sumx / n;
    final ybar = sumy / n;

    // second pass: compute summary statistics
    var xxbar = 0.0;
    var yybar = 0.0;
    var xybar = 0.0;
    for (int i = 0; i < n; i++) {
      xxbar += (x[i] - xbar) * (x[i] - xbar);
      yybar += (y[i] - ybar) * (y[i] - ybar);
      xybar += (x[i] - xbar) * (y[i] - ybar);
    }
    _slope = xybar / xxbar;
    _intercept = ybar - _slope * xbar;

    // more statistical analysis
    var rss = 0.0; // residual sum of squares
    var ssr = 0.0; // regression sum of squares
    for (int i = 0; i < n; i++) {
      final fit = _slope * x[i] + _intercept;
      rss += (fit - y[i]) * (fit - y[i]);
      ssr += (fit - ybar) * (fit - ybar);
    }

    final degreesOfFreedom = n - 2;
    _r2 = ssr / yybar;
    final svar = rss / degreesOfFreedom;
    _svar1 = svar / xxbar;
    _svar0 = svar / n + xbar * xbar * _svar1;
  }

  double _intercept;
  double _slope;
  double _r2;
  double _svar0;
  double _svar1;

  /// Returns the y-intercept &alpha;
  /// of the best of the best-fit line y = &alpha; + &beta; x.
  double get intercept => _intercept;

  /// Returns the slope &beta;
  /// of the best of the best-fit line y = &alpha; + &beta; x.
  double get slope => _slope;

  /// Returns the coefficient of determination R_2,
  /// which is a real number between 0 and 1
  double get r2 => _r2;

  /// Returns the standard error of the estimate for the intercept
  double get interceptStdErr => sqrt(_svar0);

  /// Returns the standard error of the estimate for the slope
  double get slopeStdErr => sqrt(_svar1);

  /// Returns the expected response y given the value of the predictor
  /// variable [x].
  ///
  /// [x] the value of the predictor variable
  /// Returns the expected response y given the value of the predictor
  /// variable [x]
  double predict(double x) => _slope * x + _intercept;

  /// Trifft eine Vorhersage über die Durchschnittsnote für das nächste
  /// Semester basierend auf den bekannten Daten.
  /// Als Grundlage wird die durchschnittliche Wochenstundenanzahl genommen.
  static double predictNextSemester(List<GradePrediction> knownFactors) {
    final grades = knownFactors.map((e) => e.grade).toList(growable: false);
    final weekhours =
        knownFactors.map((e) => e.weekHours).toList(growable: false);
    final averageWeekhours = weekhours.reduce(_toSum) / weekhours.length;

    final regression = LinearRegression(weekhours, grades);
    return regression.predict(averageWeekhours);
  }
}

double _toSum(double a, double b) => a + b;
