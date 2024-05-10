import 'package:bidding_house/core/utils/imports.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      Routers.goRouteFade(const SplashView(), '/'),
      Routers.goRouteFade(const AuthView(), Routers.auth),
    ],
  );
}
