import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

/// Der WebviewCookieManager funktioniert nicht 100% auf der Dart-Seite.
/// Daher hier eine eigene Implementation.
class CustomCookieManager {
  /// Creates a [CustomCookieManager].
  /// Returns the instance if it's already been called.
  factory CustomCookieManager() {
    return _instance ??= CustomCookieManager._();
  }

  CustomCookieManager._();

  static const MethodChannel _channel = MethodChannel('webview_cookie_manager');

  static CustomCookieManager _instance;

  /// Gets whether there are stored cookies
  Future<bool> hasCookies() {
    return _channel
        .invokeMethod<bool>('hasCookies')
        .then<bool>((bool result) => result);
  }

  /// Read out all cookies, or all cookies for a [currentUrl] when provided
  Future<List<Cookie>> getCookies(String currentUrl) {
    return _channel.invokeListMethod<Map<dynamic, dynamic>>(
        'getCookies', <dynamic, dynamic>{
      'url': currentUrl
    }).then<List<Cookie>>((List<Map<dynamic, dynamic>> results) {
      return results
          .map((Map<dynamic, dynamic> result) {
            try {
              final Cookie c = Cookie(
                result['name'].toString(),
                result['value'].toString(),
              );
              return c;
            } catch (e) {
              return null;
            }
          })
          .where((e) => e != null)
          .toList();
    });
  }
}
