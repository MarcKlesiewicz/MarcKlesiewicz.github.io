import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/list_extensions.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/text/styled_text.dart';
import 'package:marc_klesiewicz/widgets/text/text_settings.dart';

class AboutPointsSection extends StatelessWidget {
  const AboutPointsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final breakPoint = MediaQuery.of(context).size.width <= 600;
    return Padding(
      padding: breakPoint ? Insets.x05 : EdgeInsets.zero,
      child: Flex(
        direction: breakPoint ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment:
            breakPoint ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          _AboutPoint(
            breakPoint: breakPoint,
            filename: 'education',
            title: translate('education'),
            description: translate('education_description'),
          ),
          _AboutPoint(
            breakPoint: breakPoint,
            filename: 'profession',
            title: translate('profession'),
            description: translate('profession_description'),
          ),
          _AboutPoint(
            breakPoint: breakPoint,
            filename: 'focus',
            title: translate('motivation'),
            description: translate('motivation_description'),
          ),
        ].gap(breakPoint ? Gaps.mdV : Gaps.mdH),
      ),
    );
  }
}

class _AboutPoint extends StatelessWidget {
  final String filename;
  final String title;
  final String description;
  final bool breakPoint;
  const _AboutPoint({
    Key? key,
    required this.filename,
    required this.title,
    required this.description,
    required this.breakPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: breakPoint ? 0 : 1,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/$filename.svg',
                height: 55,
                colorFilter: ColorFilter.mode(
                  context.colors.primary.withOpacity(0.1),
                  BlendMode.srcIn,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'BerkshireSwash',
                  fontSize: 28,
                ),
              ),
            ],
          ),
          LabelLarge.primary(
            description,
            settings: TextSettings(
              textAlign: breakPoint ? TextAlign.center : TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
