import '../../../../../core/utils/imports.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
    required this.date,
    required this.validator,
  });

  final void Function(String?) date;
  final String? Function(String?) validator;

  @override
  State<DateWidget> createState() => DateState();
}

class DateState extends State<DateWidget> {
  String text = "day\\mon\\year";
  String? validationMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
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
                  validationMessage = null;
                });
              }
            }
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        if (validationMessage != null)
          Text(
            validationMessage!,
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }

  void validate() {
    setState(() {
      validationMessage = widget.validator(text);
    });
  }
}

