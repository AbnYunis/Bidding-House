import 'dart:developer';
import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/payment/presentations/views/widgets/payment_appbar.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({super.key});

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentAppBar(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      log('payment');
                    } else {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return const ThankYouView();
                      // }));
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  height: 50.h(context),
                  minWidth: 270.w(context),
                  child: Text(
                    'Payment',
                    style:
                        AppTextStyles.style16_800(context, CustomColor.white),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
