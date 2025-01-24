import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '/core/utils/common_methods.dart';
import '/core/extensions/extensions.dart';
import '/core/error_handling/failure.dart';
import '/ui/friends/state/friends_bloc.dart';
import '/ui/friends/state/friends_event.dart';
import '/ui/shared/widgets/common_error.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  var _isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l.qr_scan),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: MobileScanner(
        onDetect: (BarcodeCapture barcodeList) {
          if (_isScanned) return;

          final lastBarCode = barcodeList.barcodes.lastOrNull;
          final displayValue = lastBarCode?.displayValue;
          if (displayValue == null) return;

          final userId = int.tryParse(displayValue);
          if (userId == null) return;

          _isScanned = true;
          _handleBarcode(userId, context);
        },
      ),
    );
  }

  void _handleBarcode(int userId, BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    callMethodWithLoadingDialogGeneric<fp.Either<Failure, void>>(
      context: context,
      callback: () {
        final friendsBloc = context.read<FriendsBloc>();
        return friendsBloc.addFriend(userId);
      },
      onFinished: (fp.Either<Failure, void> result) {
        result.fold(
          (Failure failure) => messenger.showSnackBar(
            SnackBar(content: CommonError(failure: failure)),
          ),
          (void _) {
            messenger.showSnackBar(
              SnackBar(content: Text(context.l.added_success)),
            );
            final bloc = context.read<FriendsBloc>();
            bloc.add(GetFriendsEvent());
          },
        );
        context.nav.pop();
      },
    );
  }
}
