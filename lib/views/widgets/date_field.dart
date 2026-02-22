import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  const DateField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      widget.controller.text = DateFormat('MM/dd/yy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: _pickDate,
      decoration: const InputDecoration(
        hintText: "Select date",
        suffixIcon: Icon(Icons.calendar_month_outlined, size: 20),
        border: UnderlineInputBorder(),
      ),
    );
  }
}
