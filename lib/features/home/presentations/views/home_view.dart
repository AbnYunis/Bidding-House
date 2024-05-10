import 'package:bidding_house/core/utils/imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:const HomeBody(),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetService.splash2,
                    height: 120.h(context),
                    width: 124.w(context),
                  ),
                  Container(
                    height: 120.h(context),
                    width: 124.w(context),
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
              ),
              // Expanded(
              //   child: ListView.separated(
              //     itemCount: 5,
              //     itemBuilder: (context, index) => Row(
              //       children: [
              //         Iconify(),
              //       ],
              //     ),
              //     separatorBuilder: (context, index) => SizedBoxApp(h: 20.h(context))
              //   ),
              // ),
            ],
          )
        ),
      ),
    );
  }
}
