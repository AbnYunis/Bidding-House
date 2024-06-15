import '../../../../../core/utils/imports.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key, required this.date,
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
      onTap: ()async {
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

        if (pickedDate != null) {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (pickedTime != null) {
            final DateTime combinedDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            setState(() {
              widget.date(combinedDateTime.toLocal().toIso8601String());
              text =
              "${combinedDateTime.day}/${combinedDateTime.month}/${combinedDateTime.year} ${pickedTime.format(context)}";
            });

            print(combinedDateTime.toLocal().toIso8601String());
          }
        }
      },
      child: Text(
        text,
        style: AppTextStyles.style16_800(context, CustomColor.white),
      ),
    );
  }
}