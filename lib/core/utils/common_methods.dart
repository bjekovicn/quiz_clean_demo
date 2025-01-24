import 'package:flutter/material.dart';

import '/ui/shared/widgets/common_loading.dart';

callMethodWithLoadingDialogGeneric<T>({
  required BuildContext context,
  required Future<T> Function() callback,
  Function(T res)? onFinished,
}) async {
  var myDialogRoute = DialogRoute(
    useSafeArea: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: PopScope(
          canPop: false,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 140,
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: const CommonLoading(),
              ),
            ),
          ),
        ),
      );
    },
  );
  Navigator.of(context).push(myDialogRoute);

  final result = await callback();

  if (myDialogRoute.isActive && context.mounted) {
    Navigator.of(context).removeRoute(myDialogRoute);
  }

  if (onFinished == null) return;
  onFinished(result);
}
