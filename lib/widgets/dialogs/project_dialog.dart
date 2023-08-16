import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/models/projectmodel.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/text/styled_text.dart';
import 'package:marc_klesiewicz/widgets/text/text_settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDialog extends StatelessWidget {
  final ProjectModel project;
  const ProjectDialog({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final breakPoint = MediaQuery.of(context).size.width < 650;
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadiuses.r02),
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      insetPadding: breakPoint
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      child: SizedBox(
        width: 750,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: context.colors.onPrimary.withOpacity(0.5),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        const BoxDecoration(borderRadius: BorderRadiuses.r02),
                    child: ImageSlideshow(
                      isLoop: true,
                      indicatorColor: project.imagePaths.length <= 1
                          ? Colors.transparent
                          : context.colors.primary,
                      disableUserScrolling: project.imagePaths.length <= 1,
                      children: project.imagePaths
                          .map(
                            (e) => Image.asset(
                              e,
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Gaps.mdV,
                  AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: HeadlineMedium.primary(
                      project.projectName,
                      settings: TextSettings(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    actions: [
                      if (project.website != null)
                        Padding(
                          padding: Insets.x05,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsetsDirectional.symmetric(
                                      horizontal: 8, vertical: 12)),
                              backgroundColor: MaterialStatePropertyAll(
                                  context.colors.onPrimary),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadiuses.r02),
                              ),
                            ),
                            onPressed: () => _launchUrl(),
                            child: const Text('Visit site'),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: Insets.x05,
                    child: Flex(
                      direction: breakPoint ? Axis.vertical : Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: breakPoint ? 0 : 1,
                            child: LabelLarge.primary(project.description)),
                        Gaps.md,
                        Expanded(
                          flex: breakPoint ? 0 : 1,
                          child: _ProjectPoints(
                            project: project,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.lgV,
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () => context.router.pop(),
                icon: const Icon(Icons.close),
                color: context.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      Uri(
        scheme: 'https',
        path: project.website,
      ),
    )) {
      throw Exception('Could not launch ${project.website}');
    }
  }
}

class _ProjectPoints extends StatelessWidget {
  final ProjectModel project;
  const _ProjectPoints({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (project.noteableFeatures.isNotEmpty) ...[
          TitleMedium.primary(
            translate('noteable_features'),
            settings: TextSettings(
              fontWeight: FontWeight.w600,
            ),
          ),
          ...project.noteableFeatures.map(
            (e) => Padding(
              padding: Insets.y01,
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: context.colors.primary,
                  ),
                  Gaps.smH,
                  Flexible(child: LabelLarge(e))
                ],
              ),
            ),
          ),
        ],
        if (project.techStack.isNotEmpty) ...[
          Gaps.lgV,
          TitleMedium.primary(
            translate('techstack_i_worked_with'),
            settings: TextSettings(
              fontWeight: FontWeight.w600,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ...project.techStack.map(
                  (e) => LabelLarge(e == project.techStack.last ? e : '$e • ')),
            ],
          ),
        ]
      ],
    );
  }
}
