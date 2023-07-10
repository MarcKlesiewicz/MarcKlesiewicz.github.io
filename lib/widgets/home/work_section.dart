import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rive/rive.dart';
import 'package:template/theme/theme_definition.dart';
import 'package:template/utils/list_extensions.dart';
import 'package:template/utils/utils.dart';
import 'package:template/widgets/misc/animation_scene.dart';

class WorkSection extends StatefulWidget {
  const WorkSection({Key? key}) : super(key: key);

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
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
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimationScene(_file!.mainArtboard),
            Container(
              color: context.colors.primary,
              child: Text(
                translate('work'),
                style: TextStyle(
                  color: context.colors.secondary,
                  fontFamily: 'Garamond',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: Insets.x05,
          child: Column(
            children: [
              _WorkplaceRow(
                workplaceName: 'Little Giants',
                occupation: translate('app_developer'),
                startYear: 2022,
                endYear: 2023,
              ),
              _WorkplaceRow(
                workplaceName: 'Resturant Eventyr Golf',
                occupation: translate('waiter'),
                startYear: 2021,
                endYear: 2022,
              ),
              _WorkplaceRow(
                workplaceName: 'Danski',
                occupation: translate('guide'),
                startYear: 2018,
                endYear: 2019,
              ),
              _WorkplaceRow(
                workplaceName: 'Guldborgsundhallerne',
                occupation: translate('lifeguard'),
                startYear: 2012,
                endYear: 2020,
              ),
            ].gap(Gaps.lgV),
          ),
        ),
        AnimationScene(_file!.mainArtboard),
      ].gap(Gaps.lgV),
    );
  }
}

class _WorkplaceRow extends StatelessWidget {
  final String workplaceName;
  final String occupation;
  final int startYear;
  final int? endYear;
  const _WorkplaceRow({
    Key? key,
    required this.workplaceName,
    required this.startYear,
    this.endYear,
    required this.occupation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          endYear != null ? '$startYear - $endYear' : '$startYear - ',
          style: TextStyle(
            color: context.colors.secondary,
            fontFamily: 'Montserrat',
            fontSize: 22,
          ),
        ),
        Gaps.lgH,
        Flexible(
          child: Text(
            '$workplaceName  ($occupation)',
            style: TextStyle(
              color: context.colors.secondary,
              fontSize: 32,
              fontFamily: 'BerkshireSwash',
            ),
          ),
        )
      ],
    );
  }
}
