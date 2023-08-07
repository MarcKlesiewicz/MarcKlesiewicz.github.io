import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marc_klesiewicz/models/projectmodel.dart';
import 'package:marc_klesiewicz/providers/projects_provider.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/common/animated_dialog.dart';
import 'package:marc_klesiewicz/widgets/dialogs/project_dialog.dart';

class ProjectCollage extends ConsumerWidget {
  const ProjectCollage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: _ProjectContainer(
                project: projects[0],
                height: 450,
                child: Image.asset(
                  'assets/images/monto.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gaps.mdH,
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _ProjectContainer(
                          project: projects[0],
                          backgroundColor: const Color(0xff350f54),
                          height: 225,
                          child: Padding(
                            padding: Insets.a05,
                            child: Image.asset(
                              'assets/images/selvhent_logo.png',
                            ),
                          ),
                        ),
                      ),
                      Gaps.mdH,
                      Expanded(
                        flex: 1,
                        child: _ProjectContainer(
                          project: projects[0],
                          backgroundColor: const Color(0xfffdb1ab),
                          height: 225,
                          child: Image.asset(
                            'assets/images/epi.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.mdV,
                  Row(
                    children: [
                      Expanded(
                        child: _ProjectContainer(
                          project: projects[0],
                          backgroundColor: Colors.white,
                          height: 210,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/und_logo.png',
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                                Image.asset(
                                  'assets/images/und_phones.png',
                                  fit: BoxFit.cover,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Gaps.mdV,
        Row(
          children: [
            Expanded(
              child: _ProjectContainer(
                project: projects[0],
                backgroundColor: const Color(0xfffc927c),
                height: 225,
                child: Padding(
                  padding: Insets.a05,
                  child: Image.asset('assets/images/parenthood_logo.png'),
                ),
              ),
            ),
            Gaps.mdH,
            Expanded(
              child: _ProjectContainer(
                project: projects[0],
                backgroundColor: const Color(0xffcaffdb),
                height: 225,
                child: Image.asset('assets/images/mealbuilder_logo.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ProjectContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final Color? backgroundColor;
  final ProjectModel project;
  const _ProjectContainer({
    Key? key,
    required this.child,
    required this.height,
    this.backgroundColor,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAnimatedDialog(
        context,
        ProjectDialog(project: project),
      ),
      child: HoverScaleDown(
        child: Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadiuses.r02, color: backgroundColor),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ),
    );
  }
}

class HoverScaleDown extends StatefulWidget {
  final Widget child;
  final double scaleFactor;
  final Duration duration;

  HoverScaleDown({
    required this.child,
    this.scaleFactor = 0.9,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  _HoverScaleDownState createState() => _HoverScaleDownState();
}

class _HoverScaleDownState extends State<HoverScaleDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onMouseEnter(true),
      onExit: (_) => _onMouseEnter(false),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }

  void _onMouseEnter(bool isHovering) {
    if (isHovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
