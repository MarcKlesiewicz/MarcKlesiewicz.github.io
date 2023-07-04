import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template/theme/theme_definition.dart';
import 'package:template/widgets/misc/default_navbar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.primary,
        body: CustomScrollView(
          slivers: [DefaultNavbar()],
        ));
  }
}
