import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marc_klesiewicz/router/guards.dart';
import '../router/router.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter(authGuard: AuthGuard(ref));
});
