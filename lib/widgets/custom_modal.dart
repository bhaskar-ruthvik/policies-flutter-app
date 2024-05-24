import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({super.key, required this.info});

  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0,24.0,8.0,24.0),
      child: Text(
        info,
        style: TextStyle(
            fontSize: 20,
      ),
    ),
    );
  }
}
