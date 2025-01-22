import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '/core/extensions/extensions.dart';

class QRImageScreen extends StatelessWidget {
  const QRImageScreen(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l.qr_display),
        centerTitle: true,
      ),
      body: Center(
        child: QrImageView(
          data: data,
          size: 280,
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(100, 100),
          ),
        ),
      ),
    );
  }
}
