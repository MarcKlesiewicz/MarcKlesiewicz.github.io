import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/misc/animation_scene.dart';
import 'package:marc_klesiewicz/widgets/text/styled_text.dart';
import 'package:marc_klesiewicz/widgets/text/text_settings.dart';
import 'package:rive/rive.dart';

class AboutSkillSection extends StatefulWidget {
  const AboutSkillSection({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutSkillSection> createState() => _AboutSkillSectionState();
}

class _AboutSkillSectionState extends State<AboutSkillSection> {
  final pageController = PageController(initialPage: 0);
  RiveFile? _file;

  @override
  void initState() {
    super.initState();
    preload();
  }

  Future<void> preload() async {
    rootBundle.load('assets/animations/wave.riv').then(
      (data) async {
        setState(() {
          _file = RiveFile.import(data);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    final skillItems = [
      const _SkillCard(skillName: 'Flutter', fileName: 'flutter_logo'),
      const _SkillCard(skillName: 'Dart', fileName: 'dart_logo'),
      const _SkillCard(skillName: 'Riverpod', fileName: 'riverpod_logo'),
      const _SkillCard(skillName: 'AutoRouter', fileName: 'autorouter_logo'),
      const _SkillCard(skillName: 'Github', fileName: 'github_logo_black'),
      const _SkillCard(skillName: 'Rive', fileName: 'rive_logo'),
      const _SkillCard(skillName: 'Swagger', fileName: 'swagger_logo'),
      const _SkillCard(skillName: 'GraphQL', fileName: 'graphql_logo'),
      const _SkillCard(
          skillName: 'Thunder Client', fileName: 'thunder_client_logo'),
      const _SkillCard(skillName: 'VS Code', fileName: 'vscode_logo'),
      const _SkillCard(skillName: 'Visual Studio', fileName: 'vs_logo'),
      const _SkillCard(skillName: 'ClickUp', fileName: 'clickup_logo'),
      const _SkillCard(skillName: 'Figma', fileName: 'figma_logo'),
      const _SkillCard(skillName: 'Adobe XD', fileName: 'xd_logo'),
      const _SkillCard(skillName: 'Firebase', fileName: 'firebase_logo'),
      const _SkillCard(skillName: 'Docker', fileName: 'docker_logo'),
      const _SkillCard(skillName: 'Mongo DB', fileName: 'mongodb_logo'),
      const _SkillCard(skillName: 'Compass', fileName: 'compass_logo'),
      const _SkillCard(skillName: 'PlantUml', fileName: 'plant_uml'),
      const _SkillCard(skillName: 'Visio', fileName: 'visio_logo'),
      const _SkillCard(skillName: 'C#', fileName: 'csharp_logo'),
      const _SkillCard(skillName: 'Blazor', fileName: 'blazor_logo'),
      const _SkillCard(
          skillName: 'HTML, CSS & Javascript', fileName: 'web_logo'),
      const _SkillCard(skillName: 'Microsoft Teams', fileName: 'teams_logo'),
      const _SkillCard(skillName: 'Slack', fileName: 'slack_logo'),
      const _SkillCard(skillName: 'Trello', fileName: 'trello_logo'),
      const _SkillCard(skillName: 'PhotoShop', fileName: 'photoshop_logo'),
    ];

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (_file != null) AnimationScene(_file!.mainArtboard),
            Container(
              color: context.colors.onPrimary,
              padding: Insets.x02,
              child: Text(
                translate('experince_and_knowledge'),
                style: TextStyle(
                  color: context.colors.secondary,
                  fontFamily: 'Garamond',
                  fontSize: screenSize.width <= 600 ? 22 : 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SkillInfoButton(),
        GridView.extent(
          padding: Insets.a05,
          shrinkWrap: true,
          maxCrossAxisExtent: screenSize.width <= 600 ? 50 : 100,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: skillItems,
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String skillName;
  final String fileName;
  const _SkillCard({
    Key? key,
    required this.skillName,
    required this.fileName,
  }) : super(key: key);

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Tooltip(
        message: widget.skillName,
        child: AnimatedContainer(
          duration: Durations.ms200,
          padding: Insets.a02,
          decoration: BoxDecoration(
            borderRadius: BorderRadiuses.r02,
            color: context.colors.onPrimary,
            border: Border.all(color: context.colors.primary, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: context.colors.primary,
                offset: isHovering ? const Offset(4, 4) : const Offset(2, 2),
              )
            ],
          ),
          child: SvgPicture.asset('assets/svgs/${widget.fileName}.svg'),
        ),
      ),
    );
  }
}

class SkillInfoButton extends StatefulWidget {
  const SkillInfoButton({Key? key}) : super(key: key);

  @override
  State<SkillInfoButton> createState() => _SkillInfoButtonState();
}

class _SkillInfoButtonState extends State<SkillInfoButton> {
  bool showInfo = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              showInfo = !showInfo;
            });
          },
          icon: Icon(
            Icons.info_outline,
            color: context.colors.primary.withOpacity(0.3),
          ),
        ),
        AnimatedCrossFade(
          firstChild: LabelSmall.primary(
            translate('skill_info'),
            settings: TextSettings(
              fontStyle: FontStyle.italic,
              textAlign: TextAlign.center,
            ),
          ),
          secondChild: const SizedBox(),
          crossFadeState:
              showInfo ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Durations.ms200,
        )
      ],
    );
  }
}
