

import 'package:bidding_house/core/utils/imports.dart';

CustomTransitionPage buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 500),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child)
      {
        return FadeTransition(
          opacity:
          CurveTween(curve: Curves.easeInOutCirc,).animate(animation),
          child: child,
        );
      }
  );
}

CustomTransitionPage buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 300),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child)
      {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0), // Start position outside the screen
            end: Offset.zero, // End position at the center of the screen
          ).animate(animation) ,
          child: child,
        );
      }
  );
}