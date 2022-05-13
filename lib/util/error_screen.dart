import 'package:frontend/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  final void Function() reload;

  final String message;
  final bool? needAppBar;
  ErrorScreen({required this.message, required this.reload, this.needAppBar});

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: ButtonStyles.boxDecoration,
      child: Scaffold(
        appBar: widget.needAppBar == null
            ? AppBar(
                title: const Text(
                  "buildH",
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
              )),
              ElevatedButton.icon(
                onPressed: widget.reload,
                icon: Icon(
                  Icons.replay,
                  color: Colors.black,
                ),
                label: Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).bottomAppBarColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
