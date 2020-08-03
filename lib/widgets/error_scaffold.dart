import 'package:flutter/material.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    Key key,
    @required this.title,
    @required this.errorMessage,
  }) : super(key: key);

  final String title;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
