import 'dart:developer';

import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

void logNestedFields(Map<String, dynamic> map, {String prefix = 'd'}) {
  map.forEach((key, value) {
    final currentKey = '$prefix.$key'; // Build the hierarchical key

    if (value is Map<String, dynamic>) {
      // Log the current map
      log('[log] Field: $currentKey, Value: $value, Type: ${value.runtimeType}');
      logNestedFields(value, prefix: currentKey); // Recurse for nested maps
    } else if (value is List) {
      // Log the list and its items
      log('[log] Field: $currentKey, Value: $value, Type: List<${value.runtimeType}>');
      for (var i = 0; i < value.length; i++) {
        if (value[i] is Map<String, dynamic>) {
          logNestedFields(value[i] as Map<String, dynamic>,
              prefix: '$currentKey[$i]');
        } else {
          log('[log] Field: $currentKey[$i], Value: ${value[i]}, Type: ${value[i].runtimeType}');
        }
      }
    } else {
      // Log primitive values
      log('[log] Field: $currentKey, Value: $value, Type: ${value.runtimeType}');
    }
  });
}
