import 'package:flutter/material.dart';

showAnimatedDialog(
  BuildContext context,
  Widget dialog, {
  Function(dynamic value)? onPop,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (context, animation, secondaryAnimation) {
      return const SizedBox();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut.transform(animation.value);
      return Transform.scale(scale: curve, child: dialog);
    },
    transitionDuration: const Duration(milliseconds: 300),
  ).then((value) {
    if (onPop != null) {
      return onPop(value);
    }
  });
}
