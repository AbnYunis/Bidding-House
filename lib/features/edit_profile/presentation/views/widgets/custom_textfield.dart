import 'package:bidding_house/core/utils/imports.dart';

class CustomTextField extends StatelessWidget {
  final String text;

  const CustomTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyles.style14_400(context, CustomColor.white),
          ),
          SizedBoxApp(
            h: 15.h(context),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
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
      ),
    );
  }
}
