import 'package:flutter/cupertino.dart';

class Label extends StatelessWidget {
  final String title;
  Label(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(this.title),
    );
  }
}
