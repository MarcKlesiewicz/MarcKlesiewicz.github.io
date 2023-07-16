import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/list_extensions.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scaffold.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scrollbar.dart';
import 'package:marc_klesiewicz/widgets/misc/fade_in.dart';
import 'package:marc_klesiewicz/widgets/project/project_collage.dart';

@RoutePage()
class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return DefaultScaffold(
      child: DefaultScrollbar(
        scrollController: scrollController,
        child: FadeIn(
          duration: Durations.ms800,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 750),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: const ProjectCollage(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
