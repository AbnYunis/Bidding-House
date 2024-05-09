import 'package:flutter/material.dart';

extension SizeExtension on num {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * (this / 812);
  }

  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * (this / 375);
  }
}
class SizeApp {
  final BuildContext context;
  double height;
  double width;

  SizeApp(this.context)
      : height = MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        width = MediaQuery.of(context).size.width;
}

class SizedBoxApp extends StatelessWidget {
  const SizedBoxApp({super.key, this.h, this.w});

  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}
