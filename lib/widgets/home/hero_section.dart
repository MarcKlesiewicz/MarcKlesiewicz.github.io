import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marc_klesiewicz/widgets/misc/fade_in.dart';
import 'package:rive/rive.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/misc/animation_scene.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({
    Key? key,
  }) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  RiveFile? _file;

  @override
  void initState() {
    super.initState();
    preload();
  }

  Future<void> preload() async {
    rootBundle.load('assets/animations/lunar_expansion.riv').then(
      (data) async {
        setState(() {
          _file = RiveFile.import(data);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = Localizations.localeOf(context).toString();

    return Stack(
      alignment: Alignment.center,
      children: [
        if (_file != null)
          AnimationScene(_file!.artboards.first, trigger: 'pressedExpand'),
        FadeIn(
          duration: const Duration(seconds: 2),
          child: Padding(
            padding: Insets.x05,
            child: IgnorePointer(
              child: SvgPicture.asset(appLocale == 'da'
                  ? 'assets/svgs/brand_da.svg'
                  : 'assets/svgs/brand_en.svg'),
            ),
          ),
        )
      ],
    );
  }
}
