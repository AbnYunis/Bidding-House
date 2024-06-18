import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/core/utils/widgets/custom_snackbar.dart';
import 'package:bidding_house/features/home/presentations/controllers/sign_out_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          body: const HomeBody(),
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
                      ),
                      Container(
                        height: 120.h(context),
                        decoration: const BoxDecoration(color: Colors.black12),
                        child: Center(
                            child: Text(
                              "Bidding\nHouse",
                              style: AppTextStyles.style46_800(
                                  context, CustomColor.white)
                                  .copyWith(fontSize: 32.w(context)),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: .5,
                  ),
                  ListTile(
                    onTap: () {
                      context.pop();
                      context.push(Routers.auction);
                    },
                    title: Text(
                      'Auction',
                      style:
                      AppTextStyles.style20_800(context, CustomColor.white),
                    ),
                  ),
                  const Divider(
                    thickness: .5,
                  ),
                  SizedBoxApp(
                    h: 20..h(context),
                  ),
                  SizedBox(
                    width: 200.w(context),
                    child: BlocConsumer<SignOutCubit, SignOutState>(
                      listener: (context, state) {
                        if (state is SignOutFailure) {
                          return snackBar(state.message, context, Colors.red);
                        }
                        if (state is SignOutSuccess) {
                          GoRouter.of(context).go(Routers.auth);
                          return snackBar(state.message, context, Colors.white);
                        }
                      },
                      builder: (context, state) {
                        if (state is SignOutLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return MaterialButton(
                            height: 50.h(context),
                            color: Colors.green,
                            onPressed: () {
                              BlocProvider.of<SignOutCubit>(context).signOut();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10.w(context)),
                              side: const BorderSide(color: Color(0xFF2E2E2F)),
                            ),
                            child: Text(
                              'Sign out',
                              style: AppTextStyles.style16_400(
                                  context, CustomColor.white),
                            ),
                          );
                        }
                      },
                    ),
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
              )),
        ),
      ),
    );
  }
}
