import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:template/utils/utils.dart';
import 'package:template/widgets/misc/animation_scene.dart';

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
    if (_file != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          AnimationScene(_file!.mainArtboard),
          Padding(
            padding: Insets.x05,
            child: SvgPicture.asset('assets/svgs/brand_en.svg'),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
