import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.backgroundColor,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
    );
  }
}
