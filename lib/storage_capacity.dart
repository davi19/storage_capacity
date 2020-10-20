import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class StorageCapacity {
  static const MethodChannel _channel = const MethodChannel('storage_capacity');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static get getFreeSpace async {
    var result = await _channel.invokeMethod('getFreeSpace');
    return result;
  }

  static get getOccupiedSpace async {
    var result = await _channel.invokeMethod('getOccupiedSpace');
    return result;
  }

  static get getTotalSpace async {
    var result = await _channel.invokeMethod('getTotalSpace');
    return result;
  }

  static toMegaBytes(value) {
    return (double.parse(value) / 1000000).toStringAsFixed(2);
  }

  static toGigaBytes(double value) {
    return (value / 1000000000).toStringAsFixed(2);
  }

  static List<double> _capacities = [16, 32, 64, 128, 256, 512, 1024];

  static searchCapacity(double totalCapacity) {
    var i = _capacities.length ~/ 2;
    var changeCapacity = true;

    while (changeCapacity) {
      var difference = totalCapacity - _capacities[i];
      if (difference < 0 && difference < -4) {
        debugPrint(_capacities[i].toString());
        i = i - 1;
      } else if ((difference < 0 && difference > -4)) {
        changeCapacity = false;
      } else {
        changeCapacity = false;
      }
    }
    return _capacities[i].toString();
  }
}
