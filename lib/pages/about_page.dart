import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scaffold.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: CustomScrollView(),
    );
  }
}
