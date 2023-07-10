import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template/theme/theme_definition.dart';
import 'package:template/utils/utils.dart';
import 'package:template/widgets/home/hero_section.dart';
import 'package:template/widgets/home/social_section.dart';
import 'package:template/widgets/home/work_section.dart';
import 'package:template/widgets/misc/default_scaffold.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return DefaultScaffold(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 750),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: const HeroSection(),
                ),
                const WorkSection(),
                Gaps.lgV,
                const SocialSection(),
                Gaps.lgV,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
