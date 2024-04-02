import 'package:flutter/material.dart';

class Commoncalender extends StatefulWidget {
  const Commoncalender(
      {super.key, required this.datecontroller, required this.hint});

  @override
  State<Commoncalender> createState() => _CommoncalenderState();
  final TextEditingController datecontroller;
  final String hint;
}

class _CommoncalenderState extends State<Commoncalender> {
  DateTime selectedDate = DateTime.now();
  // DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        widget.datecontroller.text = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: TextField(
        readOnly: true,
        controller: widget.datecontroller,
        decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: IconButton(
                onPressed: () => selectDate(context),
                icon: const Icon(Icons.calendar_today)),
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
