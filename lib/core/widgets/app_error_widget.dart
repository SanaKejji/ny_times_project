import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({Key? key, required this.onClick}) : super(key: key);
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [Icon(Icons.refresh), Text('Something went wrong try again')],
      ),
    );
  }
}
