import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the ChartJs plugin.
///
/// # Not used :-)
///
class ChartJsPlatformInterface {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'chartjs',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = ChartJsPlatformInterface();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'chartjs for web doesn\'t implement \'${call.method}\'',
        );
    }
  }
}
