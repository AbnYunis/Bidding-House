import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/home/presentations/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      Routers.goRouteFade(const HomeView(), '/'),
    ],
  );
}
