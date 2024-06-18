import 'package:bidding_house/core/utils/imports.dart';

abstract class Routers {
  static const auth = '/auth';
  static const bnb = '/bnb';
  static const category = '/category';
  static const auction = '/auction';
  static const payment = '/payment';
  static const profile = '/profile';
  static const addPost = '/addPost';
  static const biddingNow = '/biddingNow';
  static GoRoute goRouteFade(Widget screen, String path) {
    return GoRoute(
      path: path,
      builder: (context, state) => screen,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context,
        state: state,
        child: screen,
      ),
    );
  }

  static GoRoute goRouteSlide(Widget screen, String path) {
    return GoRoute(
      path: path,
      builder: (context, state) => screen,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context,
        state: state,
        child: screen,
      ),
    );
  }
}
