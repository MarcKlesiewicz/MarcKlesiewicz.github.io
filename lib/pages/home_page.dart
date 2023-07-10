import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/home/hero_section.dart';
import 'package:marc_klesiewicz/widgets/home/social_section.dart';
import 'package:marc_klesiewicz/widgets/home/work_section.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scaffold.dart';
import 'package:marc_klesiewicz/widgets/misc/default_scrollbar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenSize = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return DefaultScaffold(
      child: DefaultScrollbar(
        scrollController: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 750),
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
      ),
    );
  }
}
