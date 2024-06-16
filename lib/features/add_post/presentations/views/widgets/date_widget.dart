import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
    required this.date,
  });

  final void Function(String?) date;

  @override
  State<DateWidget> createState() => _DateState();
}

class _DateState extends State<DateWidget> {
  String text = "day\\mon\\year";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  surface: Colors.blueGrey,
                  onSurface: Colors.yellow,
                ),
                dialogBackgroundColor: Colors.blueGrey[900],
              ),
              child: child!,
            );
          },
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );

        if (pickedDate != null && context.mounted) {
          final TimeOfDay? pickedTime = await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );

          if (pickedTime != null && context.mounted) {
            final DateTime combinedDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            setState(() {
              widget.date(combinedDateTime.toLocal().toIso8601String());
              text = "${combinedDateTime.day}/${combinedDateTime.month}/${combinedDateTime.year} ${pickedTime.format(context)}";
            });
          }
        }
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
