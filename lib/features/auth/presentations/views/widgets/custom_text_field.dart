import 'package:bidding_house/core/utils/imports.dart';

class TextFormWithName extends StatelessWidget {
  const TextFormWithName({
    super.key,
    required this.text,
    required this.textName,
    this.validator, this.controller,
  });

  final String textName;
  final String text;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textName,
          style: AppTextStyles.style14_400(context, CustomColor.white),
        ),
        SizedBoxApp(h: 16.h(context)),
        TextFormField(
          controller:controller,
          validator: validator,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: AppTextStyles.style14_400(context, CustomColor.grey),
            fillColor: const Color(0xFFD9D9D9),
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.h(context), horizontal: 14.w(context)),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.w(context))),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color(0xFFCAA138), width: 2.5.w(context)),
              borderRadius: BorderRadius.all(Radius.circular(10.w(context))),
            ),
          ),
        )
      ],
    );
  }
}
