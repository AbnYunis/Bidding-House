import 'package:bidding_house/core/utils/function/load_image.dart';
import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/views/profile_view.dart';
import 'package:bidding_house/features/search/presentations/views/search_view.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class CustomBNB extends StatefulWidget {
  const CustomBNB({super.key});

  @override
  State<CustomBNB> createState() => _CustomBNBState();
}

class _CustomBNBState extends State<CustomBNB> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeView(),
      //const AuctionView(),
      SearchView(),
      const BidsView(),
      const ProfileView(),
    ];
    List<String> icons = [
      (MaterialSymbols.home_outline_rounded),
      (Carbon.search),
      (Carbon.filter),
      (MaterialSymbols.account_circle),
    ];
    List<String> label = ['Home', 'Search', 'My Bids', 'Profile'];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          color: const Color(0xFF2E2E2F),
          width: double.infinity,
          height: 64.h(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Iconify(
                        icons[index],
                        size: 24.w(context),
                        color: (currentIndex == index)
                            ? const Color(0xFFFFCC0A)
                            : Colors.white,
                      ),
                      Text(
                        label[index],
                        style: AppTextStyles.style7_700(
                            context, CustomColor.white),
                      )
                    ],
                  ),
                ),
              ),
            )..insert(2, SizedBoxApp(w: 48.w(context))),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            chooseImages(context).then((value) {
              if (value.isNotEmpty) context.push(Routers.addPost, extra: value);
            });
          },
          child: CircleAvatar(
            radius: 29.w(context),
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              size: 24.w(context),
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
