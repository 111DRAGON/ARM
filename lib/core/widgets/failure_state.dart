import 'package:flutter/material.dart';

class FailureState extends StatelessWidget {
  const FailureState(this.errorMessage,{super.key});

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
