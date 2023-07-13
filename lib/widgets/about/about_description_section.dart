import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/about/about_dropdown_button.dart';
import 'package:marc_klesiewicz/widgets/misc/rotating.dart';
import 'package:marc_klesiewicz/widgets/text/styled_text.dart';

class AboutDescriptionSection extends StatefulWidget {
  const AboutDescriptionSection({Key? key}) : super(key: key);

  @override
  State<AboutDescriptionSection> createState() =>
      _AboutDescriptionSectionState();
}

class _AboutDescriptionSectionState extends State<AboutDescriptionSection> {
  AboutTypes _selectedAboutType = AboutTypes.long;
  @override
  Widget build(BuildContext context) {
    final screenSize = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Container(
      padding: screenSize.width <= 600 ? Insets.x05 : EdgeInsets.zero,
      child: Column(
        children: [
          Gaps.lgV * 2,
          Text(
            translate('who_is_marc'),
            style: TextStyle(
              color: context.colors.primary,
              fontFamily: 'Garamond',
              fontSize: 45,
              fontWeight: FontWeight.w600,
            ),
          ),
          HeadlineSmall.primary(translate('by')),
          Gaps.smV,
          AboutDropdownButton(
            onChanged: (type) {
              setState(() {
                _selectedAboutType = type;
              });
            },
          ),
          Gaps.lgV,
          _MainSection(
            type: _selectedAboutType,
          )
        ],
      ),
    );
  }
}

class _MainSection extends StatefulWidget {
  final AboutTypes type;
  const _MainSection({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<_MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<_MainSection> {
  final _abouts = [
    translate('abouts_long'),
    translate('abouts_speed'),
    translate('abouts_generated'),
    'WIB'
  ];
  @override
  Widget build(BuildContext context) {
    final breakPoint = MediaQuery.of(context).size.width <= 600;

    return Flex(
      direction: breakPoint ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment:
          breakPoint ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: breakPoint ? 0 : 1,
          child: LabelLarge.primary(
            _getAboutVersion(widget.type),
          ),
        ),
        Gaps.lg,
        Expanded(
          flex: breakPoint ? 0 : 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiuses.r02,
                ),
                child: Image.asset(
                  'assets/images/me.jpg',
                  height: 450,
                ),
              ),
              Positioned(
                right: 35,
                top: -20,
                child: Rotating(
                  duration: 30,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: context.colors.onPrimary,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getAboutVersion(AboutTypes type) {
    switch (type) {
      case AboutTypes.long:
        return _abouts[0];
      case AboutTypes.speed:
        return _abouts[1];
      case AboutTypes.generated:
        return _abouts[2];
      case AboutTypes.mom:
        return _abouts[3];
      default:
        return _abouts[0];
    }
  }
}
