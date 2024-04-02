import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key,
      required this.taskcontroller,
      required this.hint,
      this.maxleng,
      this.maxline});

  final TextEditingController taskcontroller;
  final String hint;
  final int? maxline;
  final int? maxleng;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: maxline,
        maxLength: maxleng,
        controller: taskcontroller,
        decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
