import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 30,
        height: 30,
        child: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.blueGrey,
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
        )));
  }
}
