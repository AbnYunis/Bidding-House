import 'package:bidding_house/core/utils/imports.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetService.splash2,
          height: 130.h(context),
        ),
        Container(
          height: 130.h(context),
          decoration: const BoxDecoration(color: Colors.black12),
          child: Center(
              child: Text(
            "Bidding\nHouse",
            style: AppTextStyles.style46_800(context, CustomColor.white)
                .copyWith(fontSize: 32.w(context)),
            textAlign: TextAlign.center,
          )),
        ),
      ],
    );
  }
}
