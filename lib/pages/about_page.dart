import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/about/about_description_section.dart';
import 'package:marc_klesiewicz/widgets/about/about_points_section.dart';
import 'package:marc_klesiewicz/widgets/about/about_skill_section.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scaffold.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scrollbar.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      backgroundColor: context.colors.onPrimary,
      child: DefaultScrollbar(
        scrollController: _scrollController,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: const Column(
                  children: [
                    AboutDescriptionSection(),
                    Gaps.lgV,
                    AboutSkillSection(),
                    Gaps.lgV,
                    AboutPointsSection(),
                    Gaps.lgV,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
