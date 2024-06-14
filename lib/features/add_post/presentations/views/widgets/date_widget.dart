import '../../../../../core/utils/imports.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
  });
  @override
  State<DateWidget> createState() => _DateState();
}
class _DateState extends State<DateWidget> {
  String text = "day\\mon\\year";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
            context: context,
            builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.dark()
                  ) ,//change to your desired color
                  child: child!);
            },
            firstDate: DateTime.now(),
            lastDate: DateTime(2025),
            initialDate: DateTime.now())
            .then((value) {
          setState(() {
            text = "${value!.day}/${value.month}/${value.year}";
          });
        });
      },
      child: Text(
        text,
        style: AppTextStyles.style16_800(context, CustomColor.white),
      ),
    );
  }
}