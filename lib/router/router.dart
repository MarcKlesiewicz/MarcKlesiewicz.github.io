import 'package:auto_route/auto_route.dart';
import 'package:marc_klesiewicz/router/guards.dart';
import 'package:marc_klesiewicz/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter({required AuthGuard authGuard}) : super() {
    routes.addAll(
      [
        CustomRoute(
            page: HomeRoute.page,
            initial: true,
            path: '/home',
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: AboutRoute.page,
            path: '/about',
            transitionsBuilder: TransitionsBuilders.fadeIn),
      ],
    );
  }

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [];
}


//TODO: custom transition 
// Route<T> slideInFromRightAndOutLeft<T>(
//   BuildContext context,
//   Widget child,
//   Page<T> page,
// ) {
//   return PageRouteBuilder(
//     settings: page,
//     pageBuilder: (context, animation, animation2) {
//       final inAnimation = CurvedAnimation(
//         parent: animation,
//         curve: Curves.fastOutSlowIn,
//       );
//       final outAnimation = CurvedAnimation(
//         parent: animation2,
//         curve: Curves.fastOutSlowIn,
//       );
//       return OverflowBox(
//         child: SlideTransition(
//           position:
//               Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
//             inAnimation,
//           ),
//           child: FadeTransition(
//             opacity: Tween(begin: .0, end: 1.0).animate(
//               inAnimation,
//             ),
//             child: SlideTransition(
//               position: Tween(begin: Offset.zero, end: const Offset(-1.0, .0))
//                   .animate(outAnimation),
//               child: FadeTransition(
//                   opacity: Tween(begin: 1.0, end: 0.0).animate(
//                     outAnimation,
//                   ),
//                   child: child),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
