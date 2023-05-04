import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final double strokeWidth;
  final double? value;
  final bool showIndicator;

  const LoadingIndicator(
      {Key? key,
      required this.color,
      required this.height,
      required this.width,
      this.strokeWidth = 2,
      this.value,
      this.showIndicator = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: showIndicator
          ? CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              value: value,
            )
          : null,
    );
  }
}
