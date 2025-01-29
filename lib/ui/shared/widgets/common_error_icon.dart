import 'package:flutter/material.dart';

class CommonErrorIcon extends StatelessWidget {
  final int failureCode;

  const CommonErrorIcon({
    super.key,
    required this.failureCode,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      switch (failureCode) {
        200 => Icons.check_circle, // Success
        201 => Icons.info, // No Content
        400 => Icons.error, // Bad Request
        401 => Icons.lock, // Unauthorized
        403 => Icons.block, // Forbidden
        404 => Icons.search_off, // Not Found
        422 => Icons.warning, // Invalid Data
        -1 => Icons
            .signal_wifi_connected_no_internet_4_outlined, // Connection Timeout
        -2 => Icons.cancel, // Cancelled
        -3 =>
          Icons.signal_wifi_connected_no_internet_4_outlined, // Receive Timeout
        -4 =>
          Icons.signal_wifi_connected_no_internet_4_outlined, // Send Timeout
        -5 => Icons.storage, // Cache Error
        -6 => Icons.wifi_off, // No Internet Connection
        -7 => Icons.location_off, // Location Denied
        -8 => Icons.error_outline, // Default Error
        -9 => Icons.signal_wifi_off, // Connection Error
        _ => Icons.help_outline, // Unknown Error
      },
      size: 40,
    );
  }
}
