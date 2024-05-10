import 'package:bidding_house/core/utils/imports.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: PaymentBody(),
      ),
    );
  }
}
