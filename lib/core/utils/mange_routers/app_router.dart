import 'package:bidding_house/core/utils/imports.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      Routers.goRouteFade(const SplashView(), '/'),
      Routers.goRouteFade(const AuthView(), Routers.auth),
      Routers.goRouteFade(const CustomBNB(), Routers.bnb),
      Routers.goRouteFade(const AuctionView(), Routers.auction),
      Routers.goRouteFade(const PaymentView(), Routers.payment),
      GoRoute(
        path: Routers.addPost,
        builder: (context, state) => AddPostView(image: state.extra as List<File>,),
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: AddPostView(image: state.extra as List<File>,),
        ),
      ),
      GoRoute(
        path: Routers.biddingNow,
        builder: (context, state) => BidView(data: state.extra as Map,),
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: BidView(data: state.extra as Map,),
        ),
      ),
      GoRoute(
        path: Routers.category,
        builder: (context, state) => CategoryView(title:state.extra as String),
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: CategoryView(title:state.extra as String),
        ),
      )
    ],
  );
}
