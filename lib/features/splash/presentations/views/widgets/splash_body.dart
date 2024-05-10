import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/core/utils/styles/text_style.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 378.h(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetService.splash1), fit: BoxFit.cover),
          ),
        ),
        SizedBoxApp(
          h: 67.h(context),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AssetService.splash2,
              height: 184.h(context),
              width: 190.w(context),
            ),
            Container(
              height: 184.h(context),
              width: 190.w(context),
              decoration: const BoxDecoration(color: Colors.black12),
              child: Center(
                  child: Text(
                "Bidding\nHouse",
                style: AppTextStyles.style46_800(context, CustomColor.white),
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        context.go(Routers.auth);
      },
    );
  }
}
