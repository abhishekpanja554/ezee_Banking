import 'package:ez_banking/core/pages/carousel/info_carousal_screen.dart';
import 'package:ez_banking/core/pages/home/home_screen.dart';
import 'package:ez_banking/core/pages/splash/splash_screen.dart';
import 'package:ez_banking/features/login/login_screen.dart';
import 'package:ez_banking/features/registration/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final router = GoRouter(
  initialLocation: SplashScreen.route,
  routes: [
    GoRoute(
      path: SplashScreen.route,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: InfoCarouselScreen.route,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const InfoCarouselScreen(),
      ),
    ),
    GoRoute(
      path: SignInScreen.route,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SignInScreen(),
      ),
    ),
    GoRoute(
      path: LoginScreen.route,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: HomeScreen.route,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HomeScreen(),
      ),
    ),
  ],
);
